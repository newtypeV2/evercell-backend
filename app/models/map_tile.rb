class MapTile < ApplicationRecord
    belongs_to :map
    belongs_to :tile
end
