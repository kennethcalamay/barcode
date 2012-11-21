print "Creating facilitators..."
Facilitator.delete_all
[
  %w[ DyQuiangco Excel blue ],
  %w[ Martinez Selle pink ]
].each do |f|
  Facilitator.create!(last_name: f[0], first_name: f[1], color: f[2])
end
puts "Done!"

print "Creating students..."
Student.delete_all
[
  %w[ Calamay   Kenneth M 1 BSCS          1 ],
  %w[ Ramos     Paul    M 2 BSCS          1 ],
  %w[ Trinidad  Jerome  M 3 Animation     1 ],
  %w[ Caguitla  Marlon  M 4 ComputerEngr  1 ],
  %w[ Manginsay Tinay   F 1 Education     2 ],
  %w[ Go        Honey   F 2 InfoTech      2 ]
].each_with_index do |s, index|
  Student.create!(last_name: s[0],
                  first_name: s[1],
                  gender: s[2],
                  year: s[3],
                  course: s[4],
                  facilitator_id: (s[5] == '1' ? Facilitator.first.id : Facilitator.last.id),
                  barcode: index+1)
end
puts "Done!"

Registration.delete_all
