class Answer < ActiveRecord::Base
  attr_accessible :body

  validates :body, presence: true

  belongs_to :question
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end
