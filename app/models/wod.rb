class Wod < ActiveRecord::Base
  belongs_to :gym
  has_many :exercises
  has_many :completions

  # scope by_name order(:name)
end
