class InstructorsController < ApplicationController
	def index
		@users = User.find_by(role: params[:role])
	end

	def show
		@user = User.find(params[:id])
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
