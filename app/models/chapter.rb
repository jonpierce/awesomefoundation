class Chapter < ActiveRecord::Base
  
  has_many :trustees, :class_name => User.name
  
  def to_param
    slug
  end
  
end