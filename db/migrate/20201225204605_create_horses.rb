class CreateHorses < ActiveRecord::Migration[6.0]
  def change
    create_table :horses do |t|
      t.string :name
      t.boolean :needs_shoes
      t.boolean :front_shoes
      t.boolean :hind_shoes
      t.boolean :winter_shoes
      t.boolean :pads
      t.integer :shoe_size
      t.text :temperament
      t.string :schedule
      t.text :comments
      t.belongs_to :farrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
