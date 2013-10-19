class Exercise < ActiveRecord::Base
  has_many :ex_wods
  has_many :workouts, through: :ex_wods
end
