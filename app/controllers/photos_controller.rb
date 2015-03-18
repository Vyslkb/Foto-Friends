class LessonsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @photo = Photo.new
    render :new
  end

  def create
    @user = User.find(params[:user_id])
    @photo = @user.photos.new(photo_params)

    if @photo.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to user_path(@user)
  end

  def update
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])
    if @photo.update(params[:photo])
      redirect_to user_path(@photo.user)
    else
      render :edit
    end
  end

  def photo_params
    params.require(:photo).permit(:title, :body, :number)
  end
end
