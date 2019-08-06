class CharactersController < ApplicationController

    def show
        render json: Character.find(params[:id]).to_json(full_info)
    end

    private

    def full_info
        {
            :except => [:created_at, :updated_at],
            :include => {
                :games =>{
                    :except => [:created_at, :updated_at]
                }
            }
        }
    end
end
