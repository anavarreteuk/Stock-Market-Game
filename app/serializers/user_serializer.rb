class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :score, :stocks
  has_many :stocks
end
