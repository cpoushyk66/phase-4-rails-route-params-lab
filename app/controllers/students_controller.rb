class StudentsController < ApplicationController

  def index
    # all the instances of a class
    if params[:name]
      students = Student.select{|student| student.first_name.downcase == params[:name].downcase || student.last_name.downcase == params[:name].downcase}
    else
      students = Student.all
   end
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

  def grades
    students = Student.order(:grade).reverse_order
    render json: students
  end

  def highest_grade
    student = Student.order(:grade).last
    render json: student
  end

end
