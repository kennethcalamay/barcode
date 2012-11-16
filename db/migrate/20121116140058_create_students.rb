class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :barcode
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :year
      t.string :course
      t.string :color

      t.timestamps
    end
  end
end
