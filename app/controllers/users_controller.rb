class UsersController < ApplicationController

  # skip_before_action :login_required, :only => [:show]


  def show
    ## DO WE NEED THIS? HERE OR SOMEWHERE ELSE?
    # @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    ###
    
    ## DON'T NEED THIS HERE IF USER#CREATE WORKS
    @spotify_response = request.env['omniauth.auth']
    @spotify_display_name = @spotify_response.info.name
    @spotify_user_id = @spotify_response.uid
    ###
    

  end

  def new
    @user = User.new
  end

  def create
    session[:user_id] = @user.id

    # @user = User.new(user_params)
    # if @user.save
    #   session[:user_id] = @user.id
    #   redirect_to root_path, :notice => "Thank you for signing up, #{@user.name}!"
    # else
    #   render :new
    # end
  end

end

