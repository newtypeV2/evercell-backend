class Monster < ApplicationRecord
    has_many :game_monsters
    has_many :games, through: :game_monsters
end
