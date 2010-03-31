class SessionsController < ApplicationController
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    @session = Session.new
  end
  
  def create
    @session = Session.new(params[:session])
    if @session.save
      redirect_back_or_default root_path
    else
      render :action => :new
    end
  end
  
  def destroy
    current_session.destroy
    redirect_back_or_default login_path
  end
  
end
