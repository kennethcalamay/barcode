require 'csv'

def do_task
  @students = []
  names = File.read("names.csv")
  csv = CSV.parse(names, :headers => false)
  csv.each do |row|
    barcode, last_name, first_name = row[0], row[1], row[2]
    student = Student.find_by_first_name_and_last_name(first_name, last_name)
    next if student.blank?
    @students << student.update_attributes(barcode: barcode)
  end; 0
  nil_count = 0
  @students.each do |s|
    nil_count += 1 if s.blank?
    puts s
  end
  puts nil_count
end

