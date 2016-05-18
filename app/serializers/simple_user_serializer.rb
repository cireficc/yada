class SimpleUserSerializer < ActiveModel::Serializer
  root :user_create_params
  attributes :id, :username, :birthdate, :country, :city, :catch
end
