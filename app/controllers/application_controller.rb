# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation
  
  # only rescue these errors when not in development
  unless ActionController::Base.consider_all_requests_local
    # these should be ordered from general to specific -- the last match wins
    rescue_from Exception, RuntimeError do |exception|
      # notify_about_exception(exception)
      render_500
    end
    rescue_from ActiveRecord::RecordNotFound,
                ActionController::RoutingError,
                ActionController::UnknownController,
                ActionController::UnknownAction, :with => :render_404
  end

  helper_method :current_user, :open_for_submissions?, :current_submission_period
  
  protected
  
  def current_session
    return @current_session if defined?(@current_session)
    @current_session = Session.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_session && current_session.record
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  def require_no_user
    if current_user
      redirect_to root_path
    end
  end
  
  def require_user
    unless current_user
      store_location
      redirect_to login_path
    end
  end
  
  def require_admin
    require_user
    if current_user and not current_user.admin?
      redirect_to root_path
    end
  end

  def render_404
    render :template => "shared/error_404", :status => :not_found
  end
  
  def render_500
    render :template => "shared/error_500", :status => :internal_server_error
  end

  def open_for_submissions?
    now = Time.zone.now
    deadline = Time.zone.local(now.year, now.mon, 15, 0, 0, 0)
    now <= deadline
  end
  
  def current_submission_period
    today = Date.today
    today.strftime("%Y%m")
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == SECRETS["username"] && password == SECRETS["password"]
    end
  end
  
end
