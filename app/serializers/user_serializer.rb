class UserSerializer < ApplicationSerializer
  attributes :name, :email

  #has_many :articles
  #has_many :comments
end
