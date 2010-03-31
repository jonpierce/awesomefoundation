class SubmissionsController < ApplicationController
  
  before_filter :require_user, :only => :index

  def index
  end
  
  def new
    @chapters = Chapter.all
    @submission = Submission.new
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