class HomeController < ApplicationController
  
  def index
  end
  
  def apply
    redirect_to new_submission_path
  end
  
  def about
  end
  
  def faq
  end
  
  def contact
  end
  
  def calendar
  end
  
  # redirects for legacy urls
  
  def whois
    redirect_to about_path, :status => :moved_permanently
  end
  
end