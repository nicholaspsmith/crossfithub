class Completion < ActiveRecord::Base
  has_many :votes
  has_many :comments
  has_one :wod
  belongs_to :user
end
