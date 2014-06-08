class Question < ActiveRecord::Base
  attr_accessible :name, :body, :vote_value
  validates :body, presence: true
  validates :name, presence: true

  has_many :answers
  has_many :tags
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  belongs_to :user
end
