class ImagesController < ApplicationController

  def create
    @user = current_user
    @image = current_user.images.build(image_params)

    respond_to do |format|
      if @image.save
        format.html
        format.js
      else
        format.html
        format.js
      end
    end
  end

  def destroy
    @user = current_user
    image = Image.find(params[:id])
    respond_to do |format|
      if image.delete
        format.html { redirect_to user_path(current_user) }
        format.js
      end
    end
  end

  private

  def image_params
    params.require(:image).permit(:image, :image_cache)
  end

end
