class InstructorsController < ApplicationController
	def index
		@users = User.all
	end

	def show
    @students = User.where(role: "student")
    binding.pry

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
