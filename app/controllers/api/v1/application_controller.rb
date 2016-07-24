module Api
  module V1
    class ApplicationController < ActionController::API
      include ActionController::Serialization
    end
  end
end

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
end
