class Comment < ApplicationRecord
  include VoteableConcern

  belongs_to :user
  belongs_to :post
  belongs_to :comment, optional: true
  has_many :comments
end
