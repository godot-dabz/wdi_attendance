class SessionsController < ApplicationController

  def index
    # @user = User.new
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

<<<<<<< HEAD

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

=======
  def destroy
    session[:user_id] = nil
    redirect_to :index
  end
>>>>>>> 27f5dab870cef1408bf14d09b79e17b5bdf22344

end
