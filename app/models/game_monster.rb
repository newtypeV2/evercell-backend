class GameMonster < ApplicationRecord
    belongs_to :game
    belongs_to :monster
end
