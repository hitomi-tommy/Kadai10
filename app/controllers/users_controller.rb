class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def edit
  end
  def favorites
  end
  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to new_session_path
      else
        render :new
      end
  end
  def update
      if @user.update(user_params)
        redirect_to user_path(@user.id)
      else
        render :edit
      end
  end
  def destroy
    @user.destroy
    redirect_to new_session_path
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_image)
  end
end
