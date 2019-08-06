class Game < ApplicationRecord
    has_many :character_games
    has_many :characters, through: :character_games
    has_many :game_monsters
    has_many :monsters, through: :game_monsters
    belongs_to :map
end
