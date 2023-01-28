class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @courses = Course.all
    @course = Course.new
  end

  def create
    @course = Course.new(create_params)
    saved = @course.save

    @courses = Course.all

    if saved
      render turbo_stream:
               turbo_stream.replace(
                 'courses_table',
                 partial: 'courses/courses_table',
                 locals: { courses: @courses }
               )
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def create_params
    params.require(:course).permit(:name)
  end
end