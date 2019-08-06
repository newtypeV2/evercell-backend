class Tile < ApplicationRecord
    has_many :map_tiles
    has_many :maps, through: :map_tiles
end
