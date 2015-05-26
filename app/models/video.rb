class Video < ActiveRecord::Base
  belongs_to :user
  YT_LINK_FORMAT = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

  before_create do
    youtube_id = url.match(YT_LINK_FORMAT)
    self.youtube_id = youtube_id[2] if youtube_id && youtube_id[2]
  end

end
