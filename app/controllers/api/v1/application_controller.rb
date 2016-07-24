module Api
  module V1
    class ApplicationController < ActionController::API
      include ActionController::Serialization
    end
  end
end

# Devise Token Auth can't find scoped classes, so give it a root-level class
# inside the scoped API directory as a work-around
class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
end
