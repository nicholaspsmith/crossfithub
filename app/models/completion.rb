class Completion < ActiveRecord::Base

  acts_as_votable

  # has_many :votes
  has_many :comments
  has_one :wod
  belongs_to :user
  belongs_to :wod


  def name
    self.wod.name
  end

  def upvotes
    # count how many upvotes this completion has
    # self.votes.where(kind: 1, completion_id: self.id).count
  end

  def downvotes
    # count how many downvotes this completion has
    self.votes.where(kind: 2, completion_id: self.id).count
  end

  def time
    time = ""
    millis = self.milliseconds % 1000
    seconds = (self.milliseconds / 1000) % 60
    minutes = (self.milliseconds / 60_000) % 60
    hours = (self.milliseconds / 3600000) % 24
    if hours > 0
      time = "#{hours}:#{minutes}:#{seconds}:#{millis}"
    else
      time = "#{minutes}:#{seconds}:#{millis}"
    end
  end
end
