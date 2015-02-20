class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
    @students = params[:student_id] : Student.all
  end

  def create



    redirect_to '/index'
  end

  def index

  end


end
