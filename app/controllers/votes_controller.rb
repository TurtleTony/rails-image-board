class VotesController < AuthenticationController
  def create votable
    vote = params[:vote].to_i > 0
    if (current_user.voted_as_when_voted_for votable) == vote
      votable.unvote_by current_user
      vote = 0
    else
      votable.vote_by :voter => current_user, :vote => vote
      vote = vote ? 1 : -1
    end
    render json: {votes: votable.weighted_score, voteable_id: votable.id, voteable_type: votable.class.to_s, vote: vote}
  end

  def post_vote
    @post = Post.find(params[:post_id])
    create(@post)
  end

  def comment_vote
    @comment = Comment.find(params[:comment_id])
    create(@comment)
  end
end
