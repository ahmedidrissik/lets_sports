class Game < ApplicationRecord
  belongs_to :sport
  belongs_to :location
  belongs_to :user, foreign_key: :creator_id
  has_many :bookings
  has_many :users, through: :bookings
end
