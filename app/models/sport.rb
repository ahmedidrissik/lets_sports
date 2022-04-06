class Sport < ApplicationRecord
  has_many :games
  has_one_attached :photo
end
