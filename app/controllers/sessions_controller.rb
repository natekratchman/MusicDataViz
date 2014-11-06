class SessionsController < ApplicationController
  
  # STUFF WE DID IN LECTURE
  # skip_before_action :login_required, :only => [:new, :create]

  # def new
  # end

  # def create    
  #   user = User.find_by(:email => params[:email])
  #   if user && user.authenticate(params[:password])
  #     session[:user_id] = user.id # Logging them in as a user.
  #     redirect_to root_path
  #   else
  #     flash.now[:notice] = "Could not find that person, sorry!"
  #     render :new
  #   end
  # end

  # def destroy
  #   reset_session
  #   flash[:notice] = "You have been logged out!"
  #   render :new
  # end

end