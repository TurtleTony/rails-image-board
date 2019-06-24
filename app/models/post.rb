class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :resource
  has_many :comments, dependent: :delete_all
  has_many :upvotes
  has_many :downvotes
  acts_as_taggable

  validate :resource_format
  validates :tag_list, presence: true

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

  def next
    Post.where("posts.id > ?", self.id).order("posts.id ASC").limit(1)[0]
  end

  def prev
    Post.where("posts.id < ?", self.id).order("posts.id DESC").limit(1)[0]
  end

  private

  def resource_format
    return unless resource.attached?
    return if resource.blob.content_type.start_with? 'image/'

    resource.purge_later
    errors.add(:resource, 'needs to be an image')
  end
end
