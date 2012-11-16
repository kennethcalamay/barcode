class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :student

      t.timestamps
    end
    add_index :registrations, :student_id
  end
end
