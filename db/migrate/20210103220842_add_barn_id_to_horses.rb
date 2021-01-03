class AddBarnIdToHorses < ActiveRecord::Migration[6.0]
  def change
    add_column :horses, :barn_id, :integer
  end
end
