# frozen_string_literal: true

module PostsHelper
  def post_to_html(post)
    render 'posts/content.html.erb', post: post
  end
end
