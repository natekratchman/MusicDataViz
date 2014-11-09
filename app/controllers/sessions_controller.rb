class SessionsController < ApplicationController
  skip_before_action :login_required #, :only => [:new, :create]

  def new
  end

  def create   
    user = User.login_from_omniauth(request.env['omniauth.auth'])
    login(user)
    flash[:notice] = "it worked"
    redirect_to root_path
  end

  def destroy
    reset_session
    flash[:notice] = "You have been logged out!"
    render :new
  end

end