class Map < ApplicationRecord
    has_many :games
    has_many :map_tiles
    has_many :tiles, through: :map_tiles
end
