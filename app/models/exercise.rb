class Exercise < ActiveRecord::Base
  has_many :ex_wods
  has_many :wods, through: :ex_wods
end
