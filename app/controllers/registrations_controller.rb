class RegistrationsController < ApplicationController
  def show
    date = Date.parse(params[:id])
    registrations = Registration.where('created_at > ? and created_at < ?',
                                        date.beginning_of_day, date.end_of_day).includes(:student)
    @students = registrations.map{|r| r.student}
    @students = @students.reject{|s| s.last_name.nil? }.sort_by!{ |s| s[:last_name]}
  end
end
