class AddBarnIdToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :barn_id, :integer
  end
end
