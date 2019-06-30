class VotesController < AuthenticationController
  def create
    @post = Post.find(params[:post_id])
    new_vote = (params[:vote] == "true" ? 1 : -1)
    previous_vote = current_user.votes.where(voteable: @post).destroy_all.first&.value
    # save new vote
    unless new_vote == previous_vote
      vote = Vote.new(user: current_user, voteable: @post, value: new_vote)
      vote.save
    end
    vote_state = Vote.voted_on_by(params[:post_id], current_user.id)
    render json: { votes: @post.calculate_upvotes, post: params[:post_id], vote: vote_state }
  end

end
