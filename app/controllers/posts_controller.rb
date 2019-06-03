class PostsController < ApplicationController
  def index
    @posts = Post.all.map(&:created_at)
  end

  def create
    current_user.posts.create!(post_params)
    redirect_to :posts
  end

  def new
    @post = Post.new
  end

  def destroy
    Post.destroy(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:resource)
  end
end
