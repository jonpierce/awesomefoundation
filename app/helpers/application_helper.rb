# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def blog_post_path(post)
    date = post.post_date
    "/blog/#{date.year}/#{date.month}/#{date.day}/#{post.post_name}"
  end
  
end
