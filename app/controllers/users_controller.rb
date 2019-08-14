class UsersController < ApplicationController
    def show
        render json: User.find(params[:id]).to_json(user_default)
    end

    private
        def user_default
            {   
                :except => [:created_at, :updated_at,:password_digest],
                :include => {
                    :characters=>{
                        :methods => [:game_session],
                        :except => [:created_at,:updated_at],
                        # :include => {
                        #     :games => {
                        #         :only => [:description],
                        #         :include =>{
                        #             :map => {
                        #                 :only => [:name]
                        #             }
                        #         }
                        #     }
                        # }
                    }
                }
            }
        end 
end
