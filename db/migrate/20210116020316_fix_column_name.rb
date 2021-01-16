class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :horses, :needs_shoes, :flagged
  end
end
