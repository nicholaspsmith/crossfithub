class Membership < ActiveRecord::Base
  # Associates User to Gym
  belongs_to :user
  belongs_to :gym
end
