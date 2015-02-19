class InstructorsController < ApplicationController
	def index
		@users = User.find_by role: "student"
	end

	def show
    @user =User.where(role: "student").find_each do |student|
      students.push(student)
    end
  end

  def new
    students = User.create student_params
    url = 'http://104.131.73.180/api/v1/students'
    @apicohorts = HTTParty.get(url)
    binding.pry
    # this is an email list form the api of all emails of the students in the api. this needs to get changed once the api gets update to include instructors
    emails = @apicohorts["cohorts"].map do |person|
      person["contact"]["email"]
    end


  end
# create a sessions variable and then get the session params


	# def edit
	# end

	# def new
	# end

	# def update

	# end

	# def destroy
	# end

	# def create
	# end


end
