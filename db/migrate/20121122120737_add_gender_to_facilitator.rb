class AddGenderToFacilitator < ActiveRecord::Migration
  def change
    add_column :facilitators, :gender, :string
  end
end
