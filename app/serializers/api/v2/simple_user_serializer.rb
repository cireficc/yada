module Api
  module V2
    class SimpleUserSerializer < ActiveModel::Serializer
      root :user
      attributes :id, :username, :birthdate, :country, :city, :catch
    end
  end
end
