class VotesController < AuthenticationController
  def create voteable
    vote = params[:vote]
    render json: Vote.ajax_create(voteable, current_user, vote)
  end

  def post_vote
    @post = Post.find(params[:post_id])
    create(@post)
  end
end
