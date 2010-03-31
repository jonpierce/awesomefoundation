class Submission < ActiveRecord::Base
  
  belongs_to :chapter
  
  [:name, :email, :description].each do |field|
    validates_presence_of field, :message => "^#{field.to_s.humanize} is required"
  end
  validates_length_of :name, :maximum => 100
  validates_length_of :email, :maximum => 100
  validates_length_of :url, :maximum => 100, :allow_blank => true
  validates_length_of :phone, :maximum => 100, :allow_blank => true
  validates_length_of :description, :maximum => 2500, :message => "^Description must be {{count}} characters or fewer"
  validates_format_of :email, :with => Authlogic::Regex.email, :allow_blank => true
  validates_url_format_of :url, :message => "^URL is invalid", :allow_blank => true
  validates_inclusion_of :chapter_id, :in => Chapter.all.map(&:id), :allow_nil => true
  
end

