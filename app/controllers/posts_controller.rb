class PostsController < AuthenticationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @posts = Post.all
  end

  def create
    current_user.posts.create!(post_params)
    redirect_to :posts
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @deletable = !current_user.nil? && @user.id == current_user.id
  end

  def destroy
    unless Post.find(params[:id]).destroy_if_belongs_to_user(current_user)
      flash[:alert] = "You may not delete others' posts"
    end
    redirect_to :posts
  end

  private

  def post_params
    params.require(:post).permit(:resource)
  end
end
