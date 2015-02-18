class InstructorsController < ApplicationController
	def index
		@User = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
	end

	def new
	end

	def update

	end

	def destroy
	end

	def create
	end


end
