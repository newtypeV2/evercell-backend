class UsersController < ApplicationController
    def show
        token = request.headers["Authentication"].split(" ").last
        user_id = decode(token)["user_id"]
        user = User.find(user_id)
        render json: user.to_json(user_default)
    end

    private

        def encode(payload)
            JWT.encode(payload,secret_key(), 'HS256')
        end

        def decode(token)
            # JWT.decode(token,secret_key(), true { algorithm: 'HS256' })[0]
            JWT.decode(token, secret_key(), true, { algorithm: 'HS256' }).first
        end

        def secret_key
            "vHipwIAnguoETsdW"
        end

        def user_default
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
