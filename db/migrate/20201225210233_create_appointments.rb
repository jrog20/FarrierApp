class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :start
      t.datetime :end
      t.text :comments
      t.belongs_to :farrier, null: false, foreign_key: true
      t.belongs_to :horse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
