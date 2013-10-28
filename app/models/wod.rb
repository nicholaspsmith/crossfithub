class Wod < ActiveRecord::Base
  belongs_to :gym
  has_many :exercises
  has_many :completions
end
