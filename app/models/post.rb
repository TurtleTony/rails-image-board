class Post < ApplicationRecord
  include VoteableConcern
  belongs_to :user
  has_one_attached :resource
  has_many :comments, dependent: :delete_all
  acts_as_taggable
  enum filter: [ :sfw, :nsfw, :nsfl ]

  validate :resource_format
  validates :filter, presence: true

  def calculate_upvotes
    self.votes.sum :value
  end

  def next(filter)
    Post.filtered(filter).where("posts.id > ?", self.id).order("posts.id ASC").limit(1)[0]
  end

  def prev(filter)
    Post.filtered(filter).where("posts.id < ?", self.id).order("posts.id DESC").limit(1)[0]
  end

  def self.filtered(filter)
    Post.where("posts.filter <= ?", filters[filter])
  end

  private

  def resource_format
    return unless resource.attached?
    return if resource.blob.content_type.start_with? 'image/'

    resource.purge_later
    errors.add(:resource, 'needs to be an image')
  end
end
