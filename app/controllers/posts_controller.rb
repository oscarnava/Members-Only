class PostsController < ApplicationController
  before_action :is_logged_in?

  def new
    @post = Post.new(params[:post][:content])
    @post.user = current_user
    render :new
  end

  def create
  end

  def index
  end

end
