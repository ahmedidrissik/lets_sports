class Sport < ApplicationRecord
  has_many :games
  has_many :events
end
