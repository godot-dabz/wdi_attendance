class CohortsController < ApplicationController

  def new
    url = "http://104.131.73.180/api/v1/cohorts"
    @cohorts = HTTParty.get(url)
    @cohort = Cohort.new

  end

  def create
    cohort = Cohort.new cohort_params
    if Cohort.exists?(cohort.id)
      redirect_to '/new'
    else
      cohort.save
      cohort.create_students
      cohort.create_instructors
      redirect_to '/cohorts'
    end
  end

  def index
    @cohorts
    if params[:producer_id]
      @producer = Producer.find(params[:producer_id])
      @cohorts = @producer.cohorts
    end
  end

  def overview

    cohort = Cohort.find(params[:cohort_id])
    @unexcused_absence = cohort.calculate_total_unexcused_absence
    @excused_absence = cohort.calculate_total_excused_absence
    @lates = cohort.calculate_total_lates
    gon.lates = @lates
  end

  # GET cohorts/:id
  def show
    @cohort = Cohort.find(params[:id])
    # if we're logged in as instructor the ID would be in session
    @user = User.find(session[:user_id])
    # @instructor = Instructor.find(2)
  end


  def cohort_params
    params.permit(
      :id,
      :name,
      :starts_on,
      :ends_on,
      :phone_number,
      :producer_id
    )
  end

end
