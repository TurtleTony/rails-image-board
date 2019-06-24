class VotesController < AuthenticationController
  def create
    @post = Post.find(params[:post_id])
    current_user.votes.where(voteable: @post).destroy_all
    vote = Vote.new(user: current_user, voteable: @post, value: (params[:vote] == "true" ? 1 : -1))
    vote.save
    render json: { votes: @post.calculate_upvotes, post: params[:post_id] }
  end

  def update

  end


  def destroy
    Post.all.find(params[:id]).destroy
  end
end
