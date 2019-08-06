class CharacterGame < ApplicationRecord
    belongs_to :character
    belongs_to :game
end
