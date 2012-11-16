class Registration < ActiveRecord::Base
  belongs_to :student
  attr_accessible :student_id
end
