class SessionsController < ApplicationController

  def index
    # @user = User.new
  end

  def new
  end


  def create
    # binding.pry
    $message = nil
    user = User.find_by({email: params["email"]})
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # if instructor show all the students for their cohort
      if user.type == "Instructor"
        redirect_to cohort_path(user.cohort)
      elsif user.type == "Producer"
        redirect_to producer_cohorts_path(user)
      else
        redirect_to student_path(user)
      end
    else
      $message = "Your username or password was incorrect."
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
