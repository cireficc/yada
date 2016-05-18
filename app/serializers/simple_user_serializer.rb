class SimpleUserSerializer < ActiveModel::Serializer
	root :user
  attributes :id, :username
end
