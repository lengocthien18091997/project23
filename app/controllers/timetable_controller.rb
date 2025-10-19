class TimetableController < ApplicationController

  def list
    if @current_user.role == 'student'
      @timetable = Timetable.joins("JOIN users ON users.id = timetables.teacher_id")
                     .where(student_id: @current_user.id)
                     .select("timetables.*, users.full_name AS full_name")
    else
      @timetable = Timetable.joins("JOIN users ON users.id = timetables.teacher_id")
                     .where(teacher_id: @current_user.id)
                     .select("timetables.*, users.full_name AS full_name")
    end
    @timetable = @timetable.paginate(page: params[:page], per_page: 3)
  end
end
