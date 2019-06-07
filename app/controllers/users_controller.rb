class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @all_posts = Post.all;
    @posts = @all_posts.select { |post| post.user_id == @user.id }
  end
end
