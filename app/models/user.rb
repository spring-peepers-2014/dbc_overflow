class User < ActiveRecord::Base

  attr_accessible :name, :email, :password, :password_digest, :bio

  has_many :answers
  has_many :questions
  has_many :comments
  has_many :votes

  has_secure_password
end
