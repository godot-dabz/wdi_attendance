class ProducersController < ApplicationController

  def new
    employee_url = "http://104.131.73.180/api/v1/employees"
    employees = HTTParty.get(employee_url)
    @producers = employees["employees"].select do |employee|
      employee["role"] == "producer"
    end
    cohort_url = "http://104.131.73.180/api/v1/cohorts"
    @cohorts = HTTParty.get(cohort_url)
    @producer = Producer.new
  end

  def create
    producer = Producer.new producer_params
    producer.save
    redirect_to '/producers'
  end

  def index
    @cohorts = Cohort.all
    # cohorts_url = "http://104.131.73.180/api/v1/cohorts"
    # cohorts = HTTParty.get(cohorts_url)
    # employee_url = "http://104.131.73.180/api/v1/employees"
    # employees = HTTParty.get(employee_url)
    # # user = User.find(session[:user_id])
    # # binding.pry
    # user = User.find(11)
    # @producer = employees["employees"].select do |employee|
    #   employee["contact"]["email"] == user.email
    # end
    # # binding.pry
    # producer_id = @producer.first["id"]
    # @cohorts = cohorts["cohorts"].select do |cohort|
    #   cohort["producer_id"] == producer_id
    # end
  end

  def show
    # cohorts_url = "http://104.131.73.180/api/v1/cohorts/#{params[:id]}/students"
    # students = HTTParty.get(cohorts_url)
    # emails = students["students"].map do |student|
    #   student["contact"]["email"]
    # end
    # binding.pry
    # @cohort_students
  end

  def producer_params
    params.permit(
      :name,
      :email,
      :cohort_id,
      :password
    )
  end

end



