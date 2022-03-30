class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.text :description
      t.datetime :date
      t.integer :capacity
      t.string :status
      t.references :sport, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.integer :creator_id

      t.timestamps
    end

    add_foreign_key :games, :users, column: :creator_id
  end
end
