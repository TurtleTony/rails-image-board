class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :resource
  has_many :comments
  has_many :upvotes
  has_many :downvotes

  validate :resource_format

  def calculate_upvotes
    @total_votes = 0

    Upvote.all.each do |vote|
      if vote.post_id == self.id
        @total_votes += 1
      end
    end

    Downvote.all.each do |vote|
      if vote.post_id == self.id
        @total_votes -= 1
      end
    end

    @total_votes
  end

  private

  def resource_format
    return unless resource.attached?
    return if resource.blob.content_type.start_with? 'image/'

    resource.purge_later
    errors.add(:resource, 'needs to be an image')
  end
end
