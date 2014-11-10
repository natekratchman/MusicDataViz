class SessionsController < ApplicationController
  skip_before_action :login_required #, :only => [:new, :create]

  def new
  end

  def create   
    @spotify_response = request.env['omniauth.auth']
    @spotify_display_name = @spotify_response.info.name
    @spotify_user_id = @spotify_response.uid    
    
    user = User.login_from_omniauth(@spotify_response)
    session[:user_id] = user.id  #same as login(user), in ApplicationController

    redirect_to user_path(user.id)
  end

  def destroy
    reset_session
    flash.now[:notice] = "You have been logged out!"
    render :new
  end

end