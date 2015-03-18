class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @name = params.fetch(:name, "default")
    @password = params.fetch(:password, "default")
    @email = params.fetch(:email, "default")
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end
    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_path
    end

    def update
      @user = User.find(params[:id])
      if @user.update(params[:user])
        redirect_to users_path
      else
        render :edit
      end
    end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
