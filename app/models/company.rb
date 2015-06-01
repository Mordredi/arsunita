class Company < ActiveRecord::Base
  belongs_to :user
  has_many :events

  mount_uploader :image, AvatarUploader

  validates :name, :description, :presence => true

end
