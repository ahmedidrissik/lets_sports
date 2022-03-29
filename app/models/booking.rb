class Booking < ApplicationRecord
  belongs_to :game
  belongs_to :user, foreign_key: :player_id
end
