class RemoveLastNameFromOwners < ActiveRecord::Migration[6.0]
  def change
    remove_column :owners, :last_name, :string
  end
end
