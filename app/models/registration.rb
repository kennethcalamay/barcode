class Registration < ActiveRecord::Base
  belongs_to :student
  attr_accessible :student_id

  def self.registered_students
    #all.map do |r|
    where('created_at >= ?', Time.now.beginning_of_day).order('id desc').map do |r|
      r.student
    end
  end

end
