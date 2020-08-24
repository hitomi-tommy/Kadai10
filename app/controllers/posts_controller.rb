class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
     @post = current_user.posts.build(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        ContactMailer.contact_mail(@post).deliver
        redirect_to posts_path, notice: "投稿しました"
      else
        render :new
      end
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path, notice: '編集しました'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: '削除しました'
  end
  def confirm
    @post = Post.new(post_params)
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:image, :content, :image_cache)
  end
end
