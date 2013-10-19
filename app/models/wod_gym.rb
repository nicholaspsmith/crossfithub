class WodGym < ActiveRecord::Base
  # Associates Gyms with WODs
  belongs_to :gym
  belongs_to :wod
end
