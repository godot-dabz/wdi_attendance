class SessionsController < ApplicationController

  def index
    @user = User.new
  end

  def create
    # binding.pry
    user = User.find_by({email: params["email"]})
    if user && user.authenticate(params[:password])
      session[:user_id] = user.user_id
      redirect_to user_path(user)
    else
      render :index
    end
  end


end
