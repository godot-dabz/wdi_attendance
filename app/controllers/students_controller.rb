class StudentsController < ApplicationController
	def show

		# students_url = "http://104.131.73.180/api/v1/students/"
		# students = HTTParty.get(students_url)
		# student_id = students["id"]

		new_student_url = "http://104.131.73.180/api/v1/students/#{params[:id]}"
		student = HTTParty.get(new_student_url)
		@student_name = student["students"][0]["data"]["first"]


	end

	def index
		students_url = "http://104.131.73.180/api/v1/students/"
		students = HTTParty.get(students_url)
		@student_first_names = students["students"].map do |student|
			student["data"]["first"]
		end

	end
end

