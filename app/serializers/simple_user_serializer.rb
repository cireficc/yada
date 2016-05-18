class SimpleUserSerializer < ActiveModel::Serializer
	root :user
  attributes :id, :username, :birthdate, :country, :city, :catch
end
