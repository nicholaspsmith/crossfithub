class Completion < ActiveRecord::Base
  has_many :votes
  has_many :comments
  belongs_to :wod
  belongs_to :user
end
