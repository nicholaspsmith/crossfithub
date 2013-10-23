class Wod < ActiveRecord::Base
  has_many :ex_wods
  has_many :exercises, through: :ex_wods
  has_many :wod_gyms
  has_many :gyms, through: :wod_gyms
  has_many :completions
end
