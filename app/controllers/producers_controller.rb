class ProducersController < ApplicationController

  def index
    cohorts_url = "http://104.131.73.180/api/v1/cohorts"
    cohorts = HTTParty.get(cohorts_url)
    employee_url = "http://104.131.73.180/api/v1/employees"
    employees = HTTParty.get(employee_url)
    # user = User.find(session[:user_id])
    user = User.find(1)
    @producer = employees["employees"].select do |employee|
      employee["contact"]["email"] == user.email
    end
    binding.pry
    producer_id = @producer.first["id"]
    @cohorts = cohorts["cohorts"].select do |cohort|
      cohort["producer_id"] == producer_id
    end
  end

  def show
    cohorts_url = "http://104.131.73.180/api/v1/cohorts/#{params[:id]}/students"
    students = HTTParty.get(cohorts_url)
    emails = students["students"].map do |student|
      student["contact"]["email"]
    end

    @cohort_students
  end

  def create
	end

end

