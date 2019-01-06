class PostsController < ApplicationController
before_action :authenticate_user,{only:[:new,:edit,:update]}

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_url, notice:"「#{@post.book_title}」を登録しました。"
    else
      render:new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    post = current_user.posts.find(params[:id])
    post.update!(post_params)
    redirect_to posts_url, notice: "「#{post.book_title}」を更新しました"
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy
    redirect_to posts_url, notice: "「#{post.book_title}を削除しました」"
  end

  private
    def post_params
      params.require(:post).permit(:book_title, :author, :publisher, :release, :sentence1, :sentence2, :sentence3, :supplement, :image)
    end

    def set_post
      @post = current_user.posts.find(params[:id])
    end

  end
