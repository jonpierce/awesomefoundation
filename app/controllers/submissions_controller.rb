class SubmissionsController < ApplicationController
  
  COLUMNS = [
    ["Chapter", proc { |row| row.chapter.name rescue "" }],
    ["Name", proc { |row| row.name }],
    ["Title", proc { |row| row.title }],
    ["Description", proc { |row| row.description }],
    ["Use", proc { |row| row.use }],
    ["URL", proc { |row| row.url }],
    ["Email", proc { |row| row.email }],
    ["Phone", proc { |row| row.phone }],
    ["Date", proc { |row| row.created_at }]
  ]
  
  # before_filter :require_user, :only => :index
  before_filter :authenticate, :only => :index

  def index
    
    @chapters = Chapter.all(:order => "name asc")

    submission = Submission.first(:order => "created_at asc")
    start_time = submission ? submission.created_at : Time.zone.now    
    start_time = start_time.in_time_zone(Time.zone_default)
    Time.use_zone(Time.zone_default) do
      now = Time.zone.now      
      if match = /^(\d{4})-(0?[1-9]|10|11|12)$/.match(params[:period])
        year, month = match[1].to_i, match[2].to_i
      end      
      unless year and month and (@period_end = Time.zone.local(year, month).end_of_month) and ((@period_start = @period_end - 1.month) <= now) and @period_end >= start_time
        @period_end = Time.zone.local(now.year, now.month).end_of_month
        @period_start = @period_end - 1.month
      end      
      @period = @period_end.strftime("%Y-%m")      
      @period_options = []
      time = now.end_of_month
      begin
        @period_options << [ time.strftime("%b %Y"), time.strftime("%Y-%m") ]
        time = time - 1.month
      end while time > start_time
    end

    where_clauses, where_params = [], []    
    where_clauses << "submissions.created_at between ? and ?"
    where_params += [@period_start, @period_end]    
    if (chapter_id = params[:chapter_id].to_i) > 0
      where_clause = "(submissions.chapter_id = ?"
      if params[:exclude_unspecified].blank?
        where_clause += " or submissions.chapter_id is null)"
      else
        where_clause += ")"
      end
      where_clauses << where_clause
      where_params << chapter_id
    elsif not params[:exclude_unspecified].blank?
      where_clauses << "submissions.chapter_id is not null"
    end
    conditions = [where_clauses.join(" and ")] + where_params
    
    submissions = Submission.scoped(:conditions => conditions, :order => "created_at desc")
    respond_to do |format|
      format.html do
        @submissions = submissions.paginate(:page => params[:page], :per_page => 50)
      end
      # format.xls do
      #   Spreadsheet.client_encoding = "UTF-8//TRANSLIT//IGNORE"
      #   book = Spreadsheet::Workbook.new
      #   sheet = book.create_worksheet        
      #   COLUMNS.each do |column|
      #     sheet.row(0).push column[0]
      #   end
      #   submissions.each_with_index do |row,index|
      #     COLUMNS.each do |column|
      #       value = column[1].call(row)
      #       value ||= ""
      #       sheet.row(index + 1).push value
      #     end
      #   end        
      #   out = StringIO.new
      #   book.write(out)
      #   xls_file = out.string
      #   send_data xls_file, :filename => "submissions.xls"
      # end
      format.csv do        
        csv_file = FasterCSV.generate(:col_sep => ",") do |csv|
          csv << COLUMNS.map { |column| column[0] }
          submissions.each do |row|
            csv_row = []
            COLUMNS.each do |column|
              csv_row << column[1].call(row)
            end
            csv << csv_row
          end
        end
        send_data csv_file, :filename => "submissions.csv"
      end
    end
  end
  
  def new
    @chapters = Chapter.all(:order => "name asc")
    @submission = Submission.new
    @submission.chapter = Chapter.find_by_slug(params[:chapter]) if params[:chapter]
  end
  
  def create
    @chapters = Chapter.all
    @submission = Submission.new(params[:submission])
    if @submission.save
      flash[:notice] = "Thanks! We've received your submission and will review it shortly. Hopefully you'll hear from us soon. But if not, don't fret. You can always submit more awesome ideas!"
      redirect_to new_submission_path
    else
      render :action => "new"
    end
  end

end