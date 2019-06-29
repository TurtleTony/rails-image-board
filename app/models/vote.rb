class Vote < ApplicationRecord
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  # returns 0 if vote does not exist
  # and 1 or -1 if the vote exists
  def self.hasVoted?(voted_on_id, voter_id)
    tmp_vote = Vote.where(:voteable_id => voted_on_id).where(user_id: voter_id)
    if not tmp_vote.first.nil?
      return tmp_vote.pluck(:value)[0]
    else
      return 0
    end
  end
end
