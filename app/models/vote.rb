class Vote < ActiveRecord::Base

  belongs_to :voteable, polymorphic: true
  belongs_to :user

  attr_accessible :vote_value

end
