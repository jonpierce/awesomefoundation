class WpPost < ActiveRecord::Base

  set_table_name "wp_posts"
  set_primary_key "ID"
  
  module Status
    PUBLISHED = "publish"
  end
  module Type
    POST = "post"
    PAGE = "page"
  end
  
  named_scope :published, :conditions => { :post_status => Status::PUBLISHED }
  named_scope :posts, :conditions => { :post_type => Type::POST }  

  def self.find_by_permalink(year, month, day, slug)
    self.first :conditions => ["YEAR(post_date) = ? AND MONTH(post_date) = ? AND DAYOFMONTH(post_date) = ? AND post_name = ?", year.to_i, month.to_i, day.to_i, slug]
  end

end

