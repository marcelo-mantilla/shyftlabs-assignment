class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new
    @student.first_name = params[:student][:first_name]
    @student.family_name = params[:student][:family_name]
    @student.date_of_birth = params[:student][:date_of_birth]

    Rails.logger.info("FUCK YOU: #{@student.first_name}")

    respond_to do |format|
      if @student.save
        format.html { redirect_to students_url, notice: "Student was succesfully added."}
        format.json { render index, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def create_params
    params.slice(:student)
  end
end