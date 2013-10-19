class Gym < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :wod_gyms
  has_many :wods, through: :wod_gyms
end
