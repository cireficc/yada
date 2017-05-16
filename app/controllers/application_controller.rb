# Devise Token Auth can't find scoped classes, so give it a root-level class
# inside the scoped API directory as a work-around
class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
end
