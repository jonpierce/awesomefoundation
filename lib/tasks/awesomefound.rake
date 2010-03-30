namespace :awesomefound do
  
  namespace :wordpress do
    
    task :configure => :environment do
      
      # install and activate theme
      
      theme_dst_path = File.join(WORDPRESS_PATH, "wp-content", "themes", WORDPRESS_THEME)
      theme_src_path = File.join(RAILS_ROOT, "wordpress", "theme")

      require "fileutils"
      FileUtils.rm_rf(theme_dst_path)
      FileUtils.cp_r(theme_src_path, theme_dst_path)
      
      class WpOption < ActiveRecord::Base
      end
      
      WpOption.update_all("option_value = '#{WORDPRESS_THEME}'", "option_name = 'template' or option_name = 'stylesheet' or option_name = 'current_theme'")
      
      # symlink into rails public dir
      
      blog_dst_path = File.join(RAILS_ROOT, "public", "blog")
      blog_src_path = WORDPRESS_PATH
      FileUtils.rm_rf(blog_dst_path)
      FileUtils.ln_s(blog_src_path, blog_dst_path, :force => true)

    end
    
  end
  
end