class User < ActiveRecord::Base

  acts_as_voter
  
  # Include default devise modules. Others available are:
  devise    :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  # , :omniauthable, :omniauth_providers => [:facebook]

  has_many  :badges
  has_many  :memberships
  has_many  :gyms, through: :memberships
  has_many  :completions
  has_many  :votes, through: :completions
  has_many  :comments, through: :completions
  has_many  :activities

  # followers
  has_many  :relationships, foreign_key: "follower_id", 
                            dependent: :destroy
                            
  has_many  :followed_users, :through => :relationships, :source => :followed

  # followed_users
  has_many  :reverse_relationships, foreign_key: "followed_id",
                                    class_name:  "Relationship",
                                    dependent:   :destroy
  has_many  :followers, through: :reverse_relationships, source: :follower

  validates :name, presence: true, length: { maximum: 50 }

  # mount_uploader :attachment, ImageUploader

  def followed_user_posts
    users = self.followed_users
    if !users.include? self
      users << self
    end
    posts = []
    users.each do |user|
      user.completions.each do |c|
        posts << c
      end
    end
    # only show 20 most recent updates
    posts.sort.reverse.first(20)
  end

  def followed_user_list
    users = []
    self.followed_users.each do |user|
      users << user
    end
    users.delete(self)
    users
  end
  
  def feed
    Completion.where("user_id = ?", id)
  end

  def self.search(query)
    if query.present?
      @user = User.where("name @@ :q or fname @@ :q or lname @@ :q", q: query).first
    else
      scoped
    end
  end

  def get_image
    if self.profile_pic
      self.profile_pic
    else
      "http://placehold.it/240x240"
    end
  end


  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
    #binding.pry
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy!
  end

  # Omniauth 

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      # user.oauth_token = auth.credentials.token
      # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      # user.save!
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]
                           )
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

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
