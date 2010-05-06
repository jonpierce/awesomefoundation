class HomeController < ApplicationController
  
  def index
  end
  
  def apply
    if params[:chapter].blank?
      redirect_to new_submission_path
    else
      redirect_to new_submission_path(:chapter => params[:chapter])
    end
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