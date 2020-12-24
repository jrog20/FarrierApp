class CreateFarriers < ActiveRecord::Migration[6.0]
  def change
    create_table :farriers do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :company_name

      t.timestamps
    end
  end
end
