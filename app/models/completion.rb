class Completion < ActiveRecord::Base
  has_many :votes
  has_many :comments
  has_one :wod
  belongs_to :user

  def time
    time = ""
    millis = self.milliseconds % 1000
    seconds = (self.milliseconds / 1000) % 60
    minutes = (self.milliseconds / 60_000) % 60
    hours = (self.milliseconds / 3600000) % 24
    if hours > 0
      time = "#{hours}:#{minutes}:#{seconds}.#{millis}"
    else
      time = "#{minutes}:#{seconds}.#{millis}"
    end
  end
end
