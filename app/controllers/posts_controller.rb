class PostsController < AuthenticationController
  skip_before_action :authenticate_user!, only: [:index, :show, :next, :prev, :filter]

  def index
    @posts = Post.filtered(@filter)
  end

  def create
    current_user.posts.create!(post_params)
    redirect_to :posts
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.filtered(@filter).find(params[:id])
    @deletable = !current_user.nil? && @post.user.id == current_user.id
  end

  def destroy
    current_user.posts.find(params[:id]).destroy
    redirect_to :posts
  end

  def filter
    filter = params[:filter].to_sym
    unless current_user || filter == :sfw
      flash[:alert] = "You need to log in to see these filters"
      redirect_to :new_user_session
      return
    end
    session[:filter] = filter
    redirect_back(fallback_location: :posts)
  end

  def add_tag
    @post = Post.find(params[:id])
    @post.tag_list.add(params[:tag_list][:tag])
    @post.save
    redirect_to :action => :show, :id => @post.id
  end

  def next
    @post = Post.find(params[:id])
    redirect_to_post(@post.next(@filter), @post)
  end

  def prev
    @post = Post.find(params[:id])
    redirect_to_post(@post.prev(@filter), @post)
  end

  private

  def redirect_to_post(post, default)
    if post.nil?
      redirect_to :action => :show, :id => default.id
    else
      redirect_to :action => :show, :id => post.id
    end
  end

  def post_params
    params.require(:post).permit(:resource, :tag_list, :filter)
  end
end
