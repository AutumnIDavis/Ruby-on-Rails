class User < ApplicationRecord
  validates_presence_of :email, :username, :password
  validates :password, confirmation: { message: "Passwords Do Not Match" }
 
  has_many :posts
end
