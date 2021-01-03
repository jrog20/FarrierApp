class CreateBarns < ActiveRecord::Migration[6.0]
  def change
    create_table :barns do |t|
      t.string :name
      t.string :manager_name
      t.string :phone
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.text :comments

      t.timestamps
    end
  end
end
