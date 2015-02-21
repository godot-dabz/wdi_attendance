class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
    @students = Student.all
  end

  def create
    # @attendances = Attendance.new attendance_params
    # @attendances.save
    # redirect_to '/attendances'
    params[:commit] # late or excused
    params[:student_id]
    attendance = Attendance.new(
      absence_type: params[:commit],
      student_id: params[:student_id],
      date: Date.today
    )
    attendance.save
    redirect_to :back
  end

  def index
    @students = Student.all
  end

  def attendance_params
    params.require(:attendance).permit(
      :absence_type,
      :date,
      :student_id
    )
  end
end
