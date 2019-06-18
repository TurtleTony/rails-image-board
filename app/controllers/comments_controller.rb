class CommentsController < AuthenticationController
  def create
    current_user.comments.create!(comment_params)
    redirect_to :controller => "posts", :action => "show", :id => params[:comment][:post_id]
  end

  def new
    @comment = Comment.new
  end

  def destroy
    current_user.comments.find(params[:id]).destroy
    redirect_to :comments
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :comment_id, :message)
  end
end
