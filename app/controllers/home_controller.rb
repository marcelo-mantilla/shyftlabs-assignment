class HomeController < ApplicationController
  def index
    @students = Student.all
    @courses = Course.all
  end
end