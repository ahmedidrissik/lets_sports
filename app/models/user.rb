class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, foreign_key: :player_id
  has_many :games, through: :bookings
  has_many :games, foreign_key: :creator_id
  has_many :events, through: :bookings
  has_many :events, foreign_key: :creator_id
end
