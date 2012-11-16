class Student < ActiveRecord::Base
  attr_accessible :barcode, :color, :course, :first_name, :gender, :last_name, :year
end
