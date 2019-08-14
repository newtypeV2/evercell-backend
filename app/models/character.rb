class Character < ApplicationRecord
    belongs_to :user
    has_many :character_games
    has_many :games, through: :character_games

    def game_session
        game = self.games.find do |game|
            game.completed == false
        end
        if game.nil?
            return {}
        else
            return {"id":game.id, "map_id":game.map_id, "description": game.description, "started": game.started, "completed": game.completed}
        end
    end

end
