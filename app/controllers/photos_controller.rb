class PhotosController < ApplicationController
  def index
    @photos = current_user.photos
  end

  def new
    @photo = current_user.photos.build
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to photos_path, notice: 'Photo has been successfully uploaded'
    else
      render :new
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    photo = Photo.find(params[:id])
    if photo.update(photo_params)
      redirect_to photos_path, notice: 'Photo is successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path, notice: 'Photo is successfully deleted'
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :image)
  end
end
