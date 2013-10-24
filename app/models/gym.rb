class Gym < ActiveRecord::Base
  has_many :wods
  has_many :memberships
  has_many :users, through: :memberships
end
