class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize_producer
    unless current_user.type == "Producer"
      if current_user.type == "Instructor"
        redirect_to cohort_path(current_user.cohort)
      elsif current_user.type == "Student"
        redirect_to student_path(current_user)
      else
        redirect_to root_path
      end
    end
  end

  def authorize_instructor
    unless (current_user.type == "Instructor") || (current_user.type == "Producer")
      if current_user.type == "Student"
        redirect_to student_path(current_user)
      else
        redirect_to root_path
      end
    end
  end

  def authorize_student
    unless (current_user.type == "Student") || (current_user.type == "Instructor") || (current_user.type == "Producer")
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def authenticate
    redirect_to '/login' unless current_user
  end

  def make_home_button
    if @current_user.type == "Producer"
      @home = producer_cohorts_path(@current_user)
    elsif @current_user.type == "Instructor"
      @home = cohort_path(@current_user.cohort)
    end
  end

  helper_method(:current_user, :authenticate, :authorize_producer, :authorize_instructor, :authorize_student, :make_home_button)

end
