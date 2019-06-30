module VoteableConcern
  extend ActiveSupport::Concern
  included do
    has_many :votes, as: :voteable
  end

  def calculate_upvotes
    self.votes.sum :value
  end
end
