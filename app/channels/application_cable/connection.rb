module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def decode(token)
      JWT.decode(token,secret_key, { algorithm: 'HS256' })[0]
    end

    def secret_key
        "vHipwIAnguoETsdW"
    end

    def find_verified_user
      # if current_user = User.find_by(id: cookies.signed[:user_id])
      if current_user = User.find_by(id: decode(request.headers["HTTP_COOKIE"].split("=").last)["user_id"])
        current_user
      else
        reject_unauthorized_connection
      end
    end
    
  end
end
