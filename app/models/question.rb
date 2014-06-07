class Question < ActiveRecord::Base
  attr_accessible :question
  validates :body, presence: true
  validates :name, presence: true

  has_many :answers
  has_many :comments, as: :commentable

  belongs_to :user
end
