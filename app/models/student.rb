class Student < ActiveRecord::Base
  attr_accessible :barcode, :color, :course, :first_name, :gender, :last_name, :year, :facilitator_id
  has_many :registrations, :dependent => :delete_all
  
  belongs_to :facilitator

  def name
    "#{last_name}, #{first_name}"
  end

  def registered?
    !registrations.where('created_at > ?', Time.now.beginning_of_day).empty?
  end

  def register!
    registrations.create!
  end
end
