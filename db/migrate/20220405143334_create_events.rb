class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.text :description
      t.string :title
      t.datetime :date
      t.integer :capacity
      t.references :sport, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.timestamps
      t.integer :creator_id
    end
    add_foreign_key :events, :users, column: :creator_id
  end
end
