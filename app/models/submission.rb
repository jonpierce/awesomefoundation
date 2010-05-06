class Submission < ActiveRecord::Base
  
  belongs_to :chapter
  
  [:name, :email, :title, :description, :use].each do |field|
    validates_presence_of field, :message => "^#{field.to_s.humanize} is required"
  end
  validates_length_of :name, :maximum => 75, :message => "^Name must be {{count}} characters or fewer"
  validates_length_of :email, :maximum => 100, :message => "^Email must be {{count}} characters or fewer"
  validates_length_of :url, :maximum => 250, :message => "^URL must be {{count}} characters or fewer", :allow_blank => true
  validates_length_of :phone, :maximum => 20, :message => "^Phone must be {{count}} characters or fewer", :allow_blank => true
  validates_length_of :title, :maximum => 50, :message => "^Title must be {{count}} characters or fewer"
  validates_length_of :description, :maximum => 2500, :message => "^Description must be {{count}} characters or fewer"
  validates_length_of :use, :maximum => 500, :message => "^Use must be {{count}} characters or fewer"
  validates_format_of :email, :with => Authlogic::Regex.email, :allow_blank => true
  validates_url_format_of :url, :message => "^URL is invalid", :allow_blank => true
  validates_inclusion_of :chapter_id, :in => Chapter.all.map(&:id), :allow_nil => true
  
  def title
    the_title = read_attribute(:title)
    the_title ||= name
  end
  
end

