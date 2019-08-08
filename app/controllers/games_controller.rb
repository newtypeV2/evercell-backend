class GamesController < ApplicationController
    
    def index
        render json: Game.all.to_json(
            :except => [:updated_at]
        )
    end

    def show
        render json: Game.find(params[:id]).to_json(full_info)
    end

    private

    def full_info
        {
            :except => [:created_at,:updated_at],
            :include => {
                :character_games => {
                    :only => [:x_coordinate,:y_coordinate,:hp,:max_hp,:id],
                    :include => {
                        :character => {
                            :except => [:created_at, :updated_at] 
                        }
                    }
                },
                :game_monsters => {
                    :only => [:x_coordinate,:y_coordinate,:hp,:max_hp,:id],
                    :include => {
                        :monster => {
                            :except => [:created_at, :updated_at, :max_hp] 
                        }
                    }
                },
                :map => {
                    :only => [:name,:x_map_size,:y_map_size,:id],   
                }
            }
        }
    end

end
