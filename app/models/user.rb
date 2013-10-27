class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :badges
  has_many :memberships
  has_many :gyms, through: :memberships
  has_many :completions
  has_many :votes
  has_many :comments
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followers, :through => :relationships, :source => :follower
  has_many :followed_users, :through => :relationships, :source => :followed

  validates :name, presence: true, length: { maximum: 50 }
  validates :password, presence: true

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
