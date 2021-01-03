class AddOwnerIdToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :owner_id, :integer
  end
end
