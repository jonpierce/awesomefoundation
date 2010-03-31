class User < ActiveRecord::Base
  
  attr_protected :admin
  
  belongs_to :chapter

  acts_as_authentic do |config|
    config.session_class = Session
    config.merge_validates_format_of_login_field_options({
      :message => "^Login may only use letters, numbers, spaces, periods, underscores and hyphens",
      :with => /\A\w[\w\.\- ]+$/,
      :unless => proc { |user| user.login.blank? }
    })
    config.merge_validates_length_of_login_field_options({
      :unless => proc { |user| user.login.blank? }
    })
    config.merge_validates_format_of_email_field_options({
      :message => "^Email is invalid",
      :unless => proc { |user| user.email.blank? }
    })
    config.merge_validates_length_of_password_field_options({
      :unless => proc { |user| user.password.blank? }
    })
    config.merge_validates_confirmation_of_password_field_options({
      :unless => proc { |user| user.password.blank? }
    })
    # disabled validations
    config.merge_validates_length_of_email_field_options({
      :if => proc { false }
    })
    config.merge_validates_length_of_password_confirmation_field_options({
      :if => proc { false }
    })
  end

  [:login, :first_name, :last_name].each do |field|
    validates_presence_of field, :message => "^#{field.to_s.humanize} is required"
  end
  validates_presence_of :password, :message => "^Password is required", :if => :require_password?
  [:first_name, :last_name].each do |f|
    validates_length_of f, :maximum => 75, :allow_nil => true
  end
  validates_length_of :bio, :maximum => 300, :allow_blank => true
  validates_length_of :twitter_username, :maximum => 15, :allow_blank => true
  validates_format_of :twitter_username, :with => /^[^@].+$/, :message => "^Twitter username is invalid", :allow_blank => true
  validates_url_format_of :url, :message => "^URL is invalid", :allow_blank => true
  validates_url_format_of :facebook_url, :message => "^Facebook URL is invalid", :allow_blank => true
  validates_url_format_of :linkedin_url, :message => "^LinkedIn URL is invalid", :allow_blank => true

  def name
    [first_name, last_name].map(&:to_s).join(" ").strip
  end
  
  def to_param
    login
  end

end