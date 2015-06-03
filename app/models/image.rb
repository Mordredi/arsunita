class Image < ActiveRecord::Base
  mount_uploader :image, AvatarUploader

  belongs_to :imageable, polymorphic: true
end
