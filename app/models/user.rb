class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  
  # Uncomment before deployment
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :badges
  has_many :memberships
  has_many :gyms, through: :memberships
  has_many :completions
  has_many :votes
  has_many :comments
end
