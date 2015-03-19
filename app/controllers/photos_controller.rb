class PhotosController < ApplicationController
  def index
    @photo = Photo.all.order("created_at DESC")
  end


  def new
    @user = User.find(params[:user_id])
    @photo = Photo.create()
  end

  def create
    @user = User.find(params[:user_id])
    @photo = Photo.create(photo_params)

    if @photo.save
      @user.photos << @photo
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show

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
    @photo << @user
    if @photo.update(params[:user])
      redirect_to user_path(@photo.user)
    else
      flash[:alert] = "Did not tag user to foto. Please contact the president."
      render :edit
    end
  end


private
  def photo_params
    params.require(:photo).permit(:photo, :url, :html, :title, :user)
  end
end
