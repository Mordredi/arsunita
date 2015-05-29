class VideosController < ApplicationController

  def create
    @user = current_user
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

  def destroy
    @user = current_user
    video = Video.find(params[:id])
    respond_to do |format|
      if video.delete
        format.html { redirect_to user_path(current_user) }
        format.js
      end
    end
  end

  private

  def video_params
    params.require(:video).permit(:url)
  end

end
