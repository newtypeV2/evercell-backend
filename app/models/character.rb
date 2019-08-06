class Character < ApplicationRecord
    belongs_to :user
    has_many :character_games
    has_many :games, through: :character_games
end
