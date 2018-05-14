class ImagesController < ApplicationController
  def new
    @image = Image.new
    @user = current_user
    @user_id = current_user.id
    if request.xhr?
      respond_to do |format|
        format.js
      end
    end
  end

  def create
    5.times { @image = current_user.images.build(image_params)
    @image.save!
    }
    unless @image.save!
      flash.now[:danger] = "エラー！"
    end
  end

  private
  def image_params
    params.require(:image).permit(:picture)
  end
end
