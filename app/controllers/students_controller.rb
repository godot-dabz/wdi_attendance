class StudentsController < ApplicationController

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
		binding.pry

		# students_url = "http://104.131.73.180/api/v1/students/"
		# students = HTTParty.get(students_url)
		# student_id = students["id"]

		# student_url = "http://104.131.73.180/api/v1/students/#{params[:id]}"
		# student = HTTParty.get(new_student_url)
		# @student_name = student["students"][0]["data"]["first"]

	end

	def index
		students_url = "http://104.131.73.180/api/v1/students/"
		students = HTTParty.get(students_url)
		@students = students["students"].map do |student|
			student["data"]["first"] + " " + student["data"]["last"]

		end
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

