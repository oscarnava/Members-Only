# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :block_unlogged, except: [:index]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new post_params

    if @post.save
      flash[:success] = 'Post succesfully saved!'
      redirect_to posts_path
    else
      flash.now[:failure] = 'Post failed to save!'
      render :new
    end
  end

  def index
    @posts = logged_in? ? Post.includes(:user).order('users.name') : Post.all
  end

  private

  def block_unlogged
    return if logged_in?

    flash[:invalid] = 'You aren´t authorized to create posts!'
    redirect_to :root
  end

  def post_params
    params.require(:post).permit :content
  end
end
