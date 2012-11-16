class AddFacilitatorIdToStudent < ActiveRecord::Migration
  def change
    add_column :students, :facilitator_id, :integer
  end
end
