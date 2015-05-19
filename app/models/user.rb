class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: {minimum: 6}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true

  validates :first_name, :last_name, :presence => true

  has_many :tickets
  has_many :events
  has_many :events, :through => :tickets

  has_many :friendees, :through => :friendships, :foreign_key => "friendee_id"
  has_many :frienders, :through => :friendships, :foreign_key => "friender_id"

  has_many :followers, :through => :followings, :foreign_key => "follower_id"
  has_many :followees, :through => :followings, :foreign_key => "followee_id"

  def full_name
    "#{first_name} #{last_name}"
  end

  def friends
    frienders + friendees
  end

end
