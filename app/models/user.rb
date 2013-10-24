class User < ActiveRecord::Base
  # Include default devise modules. Others available are:

  # Uncomment before deployment
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :badges
  has_many :memberships
  has_many :gyms, through: :memberships
  has_many :completions
  has_many :votes
  has_many :comments

  def self.vote_count(votes, kind)
    high_fives = 0
    shames = 0
    votes.each do |vote|
      high_fives += 1 if vote.kind == "High-Five"
      shames     += 1 if vote.kind == "Shame"
    end
    if kind == "High-Five"
      return high_fives
    elsif kind == "Shame"
      return shames
    else
      return nil
    end
  end
end
