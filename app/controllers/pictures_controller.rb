class PicturesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to @picture.place
    else
      render action: 'new'
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to @picture.place
  end

  private
    def picture_params
      params.require(:picture).permit(:image, :place_id)
    end
end
