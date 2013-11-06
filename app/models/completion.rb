class Completion < ActiveRecord::Base

  acts_as_votable

  # has_many :votes
  has_many :comments
  has_one :wod
  belongs_to :user
  belongs_to :wod
  accepts_nested_attributes_for :comments

  attr_accessor :minutes
  attr_accessor :seconds

  after_create :update_firebase

  def name
    self.wod.name
  end


  def downvotes
    # count how many downvotes this completion has
    self.votes.where(kind: 2, completion_id: self.id).count
  end

  def time
    time = ""
    seconds = (self.milliseconds / 1000) % 60
    minutes = (self.milliseconds / 60_000) % 60
    time = "#{minutes}:#{seconds}"
  end


  private

  def update_firebase
    # post message to firebase
    # begin
      Firebase.base_uri = Crossfithub::Application.config.firebase_uri
      if self.user
        self.user.followers.each do |follower|
          # give it completion id
          response = Firebase.push(follower.id, { :name => 'New workout', :priority => 1 })
        end
      end
    # rescue
      logger.error "Unable to update firebase"
    # end
  end
end
