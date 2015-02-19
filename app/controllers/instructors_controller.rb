class InstructorsController < ApplicationController


# create a sessions variable and then get the session params

  def new
    employee_url = "http://104.131.73.180/api/v1/employees"
    employees = HTTParty.get(employee_url)
    @instructors = employees["employees"].select do |employee|
      employee["role"] == "instructor"
    end
    @instructor = Instructor.new
    cohort_url = "http://104.131.73.180/api/v1/cohorts"
    @cohorts = HTTParty.get(cohort_url)
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
      :cohort_id
		)
	end


end
