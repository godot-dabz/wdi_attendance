class AttendancesController < ApplicationController

  before_action :make_home_button

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
    student = Student.find(params[:student_id])
    # binding.pry
    if student.late_more_than_four_times?
      attendance = student.converting_four_lates_into_one_absence
    else
      attendance = Attendance.new(
        absence_type: params[:commit],
        student_id: params[:student_id],
        date: Date.today
      )
    end
    attendance.save
    redirect_to :back
  end

  def index
    @students = Student.all
  end

  def edit
    @attendance = Attendance.find(params[:id])
    @students = params[:student_id] ? [Student.find(params[:student_id])] : Student.all
  end

  def update
    attendance = Attendance.find(params[:id])
    attendance.update attendance_params
    redirect_to cohort_calendar_path(Student.find(attendance_params[:student_id]).cohort)
  end

  def destroy
    attendance = Attendance.find(params[:id])
    attendance.delete
    redirect_to cohort_calendar_path(attendance.student.cohort)
  end

  def attendance_params
    params.require(:attendance).permit(
      :absence_type,
      :date,
      :student_id
    )
  end
end
