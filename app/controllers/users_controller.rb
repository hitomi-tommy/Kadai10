class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :favorites]
  before_action :current_user
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to new_session_path
      else
        render :new
      end
  end

  def show
  end

  def edit
  end

  def update
      if @user.update(user_params)
        redirect_to user_path(@user.id)
      else
        render :edit
      end
  end

  def favorites
    @favorites = Favorite.where(user_id: @user.id)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_image, :image_cache)
  end
  
  def check_user
      if current_user != @user
        flash[:notice] = "編集権限がありません"
        redirect_to user_path
      end
  end
end
