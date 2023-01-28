class StudentsController < ApplicationController
  def new
    @student = Student.new
    @students = Student.all
  end

  def create
    @student = Student.new(create_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to home_index_path, notice: "Student was successfully added."}
        format.json { render index, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def create_params
    params.require(:student).permit(:first_name, :family_name, :date_of_birth)
  end
end