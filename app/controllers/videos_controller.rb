class VideosController < ApplicationController

  def create
    @video = current_user.videos.build(video_params)
    respond_to do |format|
      if @video.save
        format.html { redirect_to user_path(current_user), :notice => "Video was saved" }
        format.js {}
      else
        format.html { render 'show' }
        format.js {}
      end
    end
  end

  private

  def video_params
    params.require(:video).permit(:url)
  end

end
