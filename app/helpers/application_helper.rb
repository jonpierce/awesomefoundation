# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def show_flash
    [:notice, :warning, :message].collect do |key|
      content_tag(:div, h(flash[key]), :class => "flash flash_#{key}") unless flash[key].blank?
    end.join
  end
  
  def error_messages(object)
    error_messages_for :object => object, :header_message => "Hold on a sec. That doesn't look quite right. Please fix the issues below and resubmit.", :message => nil, :class => "errors"
  end

  def page_title
    base_title = "The Awesome Foundation"
    title = @content_for_title
    title.blank? ? base_title : "#{title} - #{base_title}"
  end
  
  def blog_post_path(post)
    date = post.post_date
    "/blog/#{date.year}/#{date.month}/#{date.day}/#{post.post_name}"
  end
  
end
