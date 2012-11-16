class Facilitator < ActiveRecord::Base
  attr_accessible :color, :first_name, :last_name, :students_attributes

  has_many :students
  accepts_nested_attributes_for :students
end
