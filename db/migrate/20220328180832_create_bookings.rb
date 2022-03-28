class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :status
      t.references :game, null: false, foreign_key: true
      t.integer :player_id

      t.timestamps
    end
    add_foreign_key :bookings, :users, column: :player_id
  end
end
