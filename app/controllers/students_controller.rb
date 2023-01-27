class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create!(create_params)

    @student.valid?
    
  end

  private

  def create_params
    params.permit(%i[first_name family_name date_of_birth])
    params.require(%i[first_name family_name date_of_birth])
  end
end