class ProducersController < ApplicationController

  def index
    cohorts_url = "http://104.131.73.180/api/v1/cohorts"
    cohorts = HTTParty.get(cohorts_url)
    employee_url = "http://104.131.73.180/api/v1/employees"
    employees = HTTParty.get(employee_url)
    # all_producers = User.where(:role => "producer")
    # user = User.find(session[:user_id])
    # binding.pry
    user = User.find(6)
    @producer = employees["employees"].select do |employee|
      employee["contact"]["email"] == user.email
    end
    producer_id = @producer.first["id"]
    @cohorts = cohorts["cohorts"].select do |cohort|
      cohort["producer_id"] == producer_id
    end
  end

  def create
	end

end
