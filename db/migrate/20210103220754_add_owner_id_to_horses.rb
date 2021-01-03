class AddOwnerIdToHorses < ActiveRecord::Migration[6.0]
  def change
    add_column :horses, :owner_id, :integer
  end
end
