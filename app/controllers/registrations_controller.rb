class RegistrationsController < ApplicationController
  def show
    date = Date.parse(params[:id])
    @registrations = Registration.where('created_at > ? and created_at < ?',
                                        date.beginning_of_day, date.end_of_day).includes(:student)
  end
end
