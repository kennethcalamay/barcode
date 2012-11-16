class CreateFacilitators < ActiveRecord::Migration
  def change
    create_table :facilitators do |t|
      t.string :last_name
      t.string :first_name
      t.string :color

      t.timestamps
    end
  end
end
