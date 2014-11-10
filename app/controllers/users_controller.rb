class UsersController < ApplicationController

  skip_before_action :login_required, :only => [:show]


  def show
    @user = User.find(session[:user_id])
    @user.call(@user.spotify_user_id)
  end

  def new
    @user = User.new
  end

  def create
  end

end

