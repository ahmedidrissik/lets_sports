class Booking < ApplicationRecord
  belongs_to :game, optional: true
  belongs_to :user, foreign_key: :player_id
  belongs_to :event, optional: true
end
