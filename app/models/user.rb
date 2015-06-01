class User < ActiveRecord::Base
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader


  validates :password, length: {minimum: 6}, :on => :create
  validates :password, confirmation: true, :on => :create
  validates :password_confirmation, presence: true, :on => :create

  validates :email, uniqueness: true

  validates :first_name, :last_name, :presence => true

  has_many :tickets

  has_many :companies
  has_many :events, :through => :companies

  has_many :venues

  has_many :event_members

  has_many :followees, :foreign_key => "follower_id", class_name: "Following"
  has_many :followers, :foreign_key => "followee_id", class_name: "Following"
  has_many :followed_users, through: :followees, source: :followee
  has_many :users_following, through: :followers, source: :follower

  has_many :friendees, :foreign_key => "friender_id", :class_name => "Friendship"
  has_many :frienders, :foreign_key => "friendee_id", :class_name => "Friendship"
  has_many :friended_users, :through => :friendees, :source => :friendee
  has_many :users_friending, :through => :frienders, :source => :friender

  has_many :videos

  # after_validation :gravatar

  def full_name
    "#{first_name} #{last_name}"
  end

  def friends
    friended_users + users_friending
  end

  def unconfirmed_friendees
    friendees.where(confirmed: false)
  end

  def arts_worker?
    arts_worker
  end

  def gravatar
    self.avatar = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email.strip.downcase)}?d=mm"
  end

  def confirmed_friends
    friendees.where(confirmed: true) + frienders.where(confirmed:true)
  end

end
