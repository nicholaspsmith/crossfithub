class User < ActiveRecord::Base
  has_many :memberships
  belongs_to :gym, through: :memberships
end
