class Vote < ApplicationRecord
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  def self.ajax_create(voteable, voter, value)
    previous_vote = voter.votes.where(voteable: voteable).destroy_all.first&.value
    # save new vote
    unless value == previous_vote
      Vote.new(user: voter, voteable: voteable, value: value).save
    end
    new_vote = Vote.voted_on_by(voteable.id, voter.id)
    {votes: voteable.calculate_upvotes, voteable_id: voteable.id, voteable_type: voteable.class.to_s, vote: new_vote}
  end

  # returns 0 if vote does not exist
  # and 1 or -1 if the vote exists
  def self.voted_on_by(voteable, voter_id)
    vote = Vote.where(voteable: voteable).where(user_id: voter_id).first
    if vote.nil?
      return 0
    else
      return vote.value
    end
  end
end
