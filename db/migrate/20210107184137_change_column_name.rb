class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :owners, :first_name, :name
  end
end
