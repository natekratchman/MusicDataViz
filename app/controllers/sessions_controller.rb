class SessionsController < ApplicationController
  # skip_before_action :login_required, :only => [:new, :create]

  def new
  end

  def create   
    # request.env['omniauth.auth'].present?
    user = User.login_from_omniauth(request.env['omniauth.auth'])
    login(user)
    redirect_to root_path
  end

  def destroy
    reset_session
    flash[:notice] = "You have been logged out!"
    render :new
  end

end