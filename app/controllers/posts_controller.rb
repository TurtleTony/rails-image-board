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

  def upvote
    current_user.upvotes.where(post_id: params[:id]).destroy_all
    current_user.downvotes.where(post_id: params[:id]).destroy_all
    vote = Upvote.new(:user_id => current_user.id, :post_id => params[:id])
    vote.save
    render json: { votes: Post.find(params[:id]).calculate_upvotes, post: params[:id] }
  end

  def downvote
    current_user.upvotes.where(post_id: params[:id]).destroy_all
    current_user.downvotes.where(post_id: params[:id]).destroy_all
    vote = Downvote.new(:user_id => current_user.id, :post_id => params[:id])
    vote.save
    render json: { votes: Post.find(params[:id]).calculate_upvotes, post: params[:id] }
  end

  def add_tag
    @post = Post.find(params[:id])
    @post.tag_list.add(params[:tag_list][:tag_list])
    @post.save
    redirect_to :action => :show, :id => @post.id
  end

  def next
    @post = Post.find(params[:id])
    next_post = @post.next
    if next_post.nil?
      redirect_to :action => :show, :id => @post.id
    else
      redirect_to :action => :show, :id => next_post.id
    end
  end

  def prev
    @post = Post.find(params[:id])
    prev_post = @post.prev
    if prev_post.nil?
      redirect_to :action => :show, :id => @post.id
    else
      redirect_to :action => :show, :id => prev_post.id
    end
  end

  private

  def post_params
    params.require(:post).permit(:resource, :tag_list)
  end
end
