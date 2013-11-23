class PostsController < ApplicationController
  def new
      @post=Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  private
  def post_params
    params.require(:post).permit(:name, :coupation)
  end

end
