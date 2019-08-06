class SessionsController < ApplicationController
    
    def new
        user = User.find_by(username: params[:username])
            if user && user.authenticate(params[:password])
                render json: user.to_json(userlog_default)
            else 
                render json: {message:"Username / Password Incorrect.",authenticated:"false"}
            end
    end
    
end


private

    def user_params
        params.require(:user).permit(:username,:password)
    end

    def userlog_default
        {   
            :except => [:created_at, :updated_at,:password_digest],
            :include => {
                # :campaigns=>{
                #     :except =>[:created_at,:updated_at],
                #     :include => {
                #         :characters=>{
                #             :methods => [:avatar_available,:image_url,:in_campaign],
                #             :include => {
                #                 :char_class=>{
                #                     :only => [:id,:name,:hit_die]
                #                 },
                #                 :proficiencies=>{
                #                 :except => [:id,:created_at, :updated_at]
                #                 }
                #     }
                # }
                #     }
                # },
                :characters=>{
                    # :methods => [:avatar_available,:image_url,:in_campaign],
                    :include => {
                        # :char_class=>{
                        #     :only => [:id,:name,:hit_die]
                        # },
                        # :proficiencies=>{
                        # :except => [:id,:created_at, :updated_at]
                        # },
                        # :campaigns=>{
                        #     :except => [:id,:created_at, :updated_at]
                        # }
                    }
                }
            }
        }
    end 

end