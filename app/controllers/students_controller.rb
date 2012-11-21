class StudentsController < ApplicationController
  def index
    @students = Registration.registered_students
    @facilitators = Facilitator.all
  end

  def show
    @student = Student.where(:barcode => params[:id])

    if @student.empty?
      @student = Student.create!(:barcode => params[:id])
    else
      @student = @student.first
    end

    if @student.registered?
      render :text => '' and return
    else
      @student.register!
    end

    render layout: false
  end
end
