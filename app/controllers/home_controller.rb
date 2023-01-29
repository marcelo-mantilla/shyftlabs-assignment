class HomeController < ApplicationController
  def index
    @students = Student.all
    @courses = Course.all
    @results = Result.all
  end
end