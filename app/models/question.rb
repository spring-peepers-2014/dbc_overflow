class Question < ActiveRecord::Base
  validates :body, presence: true
  validates :name, presence: true
end