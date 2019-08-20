class SessionsController < ApplicationController
    
    def new
        user = User.find_by(username: params[:username])
            if user && user.authenticate(params[:password])
                token = encode({user_id: user.id})
                
                render json: {
                    userinfo: user.to_json(userlog_default),
                    token: token
                }
            else 
                render json: {message:"Username / Password Incorrect.",authenticated:"false"}
            end
    end
    


private

    def user_params
        params.require(:user).permit(:username,:password)
    end

    def encode(payload)
        JWT.encode(payload,secret_key(), 'HS256')
    end

    def decode(token)
        JWT.decode(token,secret_key, { algorithm: 'HS256' })[0]
    end

    def secret_key
        "vHipwIAnguoETsdW"
    end

    def userlog_default
            {   
                :except => [:created_at, :updated_at,:password_digest],
                :include => {
                    :characters=>{
                        :methods => [:game_session],
                        :except => [:created_at,:updated_at],
                    }
                }
            }
    end 

end