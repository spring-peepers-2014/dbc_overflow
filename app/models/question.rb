class Question < ActiveRecord::Base
  attr_accessible :question
  validates :body, presence: true
  validates :name, presence: true


end
