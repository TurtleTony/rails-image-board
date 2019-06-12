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
    @deletable = !current_user.nil? && @post.user.id == current_user.id
  end

  def destroy
    current_user.posts.find(params[:id]).destroy
    redirect_to :posts
  end

  private

  def post_params
    params.require(:post).permit(:resource)
  end
end
