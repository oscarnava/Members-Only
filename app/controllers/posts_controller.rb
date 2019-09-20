class PostsController < ApplicationController
  before_action :is_logged_in?
  before_action :block_unlogged, except: [:index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = 'Post succesfully saved!'
      redirect_to posts_path
    else
      flash.now[:failure] = 'Post failed to save!'
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  private

  def block_unlogged
    redirect_to :root unless is_logged_in?
  end

  def post_params
    params.require(:post).permit :content
    # (params.require(:post).permit :content) << [:user, current_user]
  end

end
