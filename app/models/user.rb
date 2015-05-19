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

  def full_name
    "#{first_name} #{last_name}"
  end

end
