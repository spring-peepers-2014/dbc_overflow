class Question < ActiveRecord::Base
  validates :body, presence: true
  validates :name, presence: true

  has_many :answers
  has_many :tags
  has_many :comments, as: :commentable

  belongs_to :user
end
