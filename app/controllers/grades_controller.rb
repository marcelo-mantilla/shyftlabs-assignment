class GradesController < ApplicationController
  def index

  end

  def new
    @grade = Grade.new
    @grades = Grade.all
  end

  def create
    @grade = update_grade_if_exists(create_params) || Grade.create(create_params)

    @grades = Grade.all

    if @grade.errors.any?
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grades.errors, status: :unprocessable_entity }
      end
    else
      render turbo_stream:
               turbo_stream.replace(
                 'grades_table',
                 partial: 'grades/grades_table',
                 locals: { grades: @grades }
               )
    end
  end

  private

  def create_params
    params.require(:grade).permit(:course_id, :student_id, :grade)
  end

  # Would not implement in controller for future applications
  def update_grade_if_exists(params)
    prev_grade = Grade.find_by(student_id: params[:student_id], course_id: params[:course_id])

    if prev_grade.present?
      prev_grade.update(params)
      prev_grade
    end
  end

end