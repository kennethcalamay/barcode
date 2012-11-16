class Student < ActiveRecord::Base
  attr_accessible :barcode, :color, :course, :first_name, :gender, :last_name, :year, :facilitator_id
  
  belongs_to :facilitator

  def name
    "#{last_name}, #{first_name}"
  end
end
