class InstructorsController < ApplicationController

  before_action :authenticate, :authorize_producer
# PJ told us create a sessions variable and then get the session params

  def new
    employee_url = "http://104.131.73.180/api/v1/employees"
    employees = HTTParty.get(employee_url)

    @instructors_hash = {}

    employees["employees"].each do |employee|
      if employee["role"] == "instructor"
        key = employee["id"]
        @instructors_hash[key] = employee
      end
    end

    @instructor = Instructor.new

    cohort_url = "http://104.131.73.180/api/v1/cohorts"
    cohorts = HTTParty.get(cohort_url)

    cohorts["cohorts"].each do |cohort|
      cohort["instructor_ids"].each do |instructor_id|
        @instructors_hash[instructor_id]["cohort"] = cohort["id"]
      end
    end

  end

	def create
		instructor = Instructor.new instructor_params
		instructor.save
		redirect_to '/instructors'
	end


  # def index
  #   @users = User.find_by role: "student"
  # end

  # def show
 #    @user =User.where(role: "student").find_each do |student|
 #      students.push(student)
 #    end
 #  end
  # def update

  # end

  # def destroy
  # end


	def instructor_params
		params.permit(
			:name,
			:email,
      :cohort_id,
      :password
		)
	end


end
