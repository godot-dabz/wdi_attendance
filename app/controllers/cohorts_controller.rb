class CohortsController < ApplicationController

  def new
    url = "http://104.131.73.180/api/v1/cohorts"
    @cohorts = HTTParty.get(url)
    @cohort = Cohort.new
    
  end

  def create
    cohort = Cohort.new cohort_params
    cohort.save
    redirect_to '/cohorts'
  end

  # GET cohorts/:id
  def show
    @cohort = Cohort.find(params[:id])
    # if we're logged in as instructor the ID would be in session
    @instructor = Instructor.find(session[:user_id])
    # @instructor = Instructor.find(2)

  end

  def cohort_params
    params.permit(
      :name,
      :starts_on,
      :ends_on
    )
  end

end
