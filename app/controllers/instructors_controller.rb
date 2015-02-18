class InstructorsController < ApplicationController
	def index
		@users = User.all
    @attendances = Attendance.all
	end

	def show
		@user = User.find(params[:id])
    @attendance = Attendance.find(params[:id])
	end

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
