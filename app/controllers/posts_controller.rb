class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :set_logo_black

  def index
    @posts = Post.all
  end

  def show
    @hide_navbar = true
    @post = Post.find(params[:id])
    @comments = Comment.where(post: @post)
    @author = User.find(@post.user_id)
    @empty_comment = Comment.new
    @return_btn = true
  end

  private

  def set_logo_black
    @logo_black = true
  end
end
