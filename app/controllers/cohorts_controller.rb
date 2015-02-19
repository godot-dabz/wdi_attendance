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

  def cohort_params
    params.permit(
      :name,
      :starts_on,
      :ends_on
    )
  end

end