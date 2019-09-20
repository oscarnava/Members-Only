class PostsController < ApplicationController
  before_action :is_logged_in?

  def new
    @post = Post.new
  end

  def create
  end

  def index
  end

end
