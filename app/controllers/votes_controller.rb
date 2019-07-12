class VotesController < AuthenticationController
  def vote(votable)
    @votable = votable
    vote = ActiveRecord::Type::Boolean.new.cast(params[:vote])
    if (current_user.voted_as_when_voted_for @votable) == vote
      @votable.unvote_by current_user
    else
      @votable.vote_by :voter => current_user, :vote => vote
    end
    respond_to do |format|
      format.js { render 'vote'}
    end
  end

  def post_vote
    vote(Post.find(params[:id]))
  end

  def comment_vote
    vote(Comment.find(params[:id]))
  end
end
