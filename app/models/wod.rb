class Wod < ActiveRecord::Base
  belongs_to :gym
  has_many :exercises
end
