class StudentsController < ApplicationController

	before_action :authenticate, :authorize_student, :make_home_button

	def new
		@cohort_id = params[:cohort_id]
		students_url = "http://104.131.73.180/api/v1/cohorts/#{@cohort_id}/students"
		@students = HTTParty.get(students_url)
		@data = {name: 'phil', absent: true}.to_json
	end

	def create
		student = Student.new student_params
		student.save
		redirect_to '/index'
	end

	def show
		@student = Student.find(params[:id])
		@lateness = @student.count_lateness
		@unexcused = @student.count_unexcused
		@excused = @student.count_excused
	end

	def index
		@students = Cohort.find(params[:cohort_id]).students
	end

	def edit
		@student = Student.find(params[:id])
	end

	def update
		student = Student.find(params[:id])
	end

	def student_params
		params.permit(
			:name,
			:email,
			:cohort_id,
			:password
		)
	end
end

