class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    # 投稿を全件取得
    @posts = Post.all
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿しました。"
      redirect_to post_path(@post.id), notice: "投稿しました。"
    else
      @user = current_user
      @posts = Post.all
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: "投稿を編集しました。"
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:body, :place_name, :post_image, :difficult)
  end
end
