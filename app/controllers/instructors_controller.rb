class InstructorsController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find_by(params[:id])

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
