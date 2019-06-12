class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :resource
  has_many :comments

  validate :resource_format

  private

  def resource_format
    return unless resource.attached?
    return if resource.blob.content_type.start_with? 'image/'

    resource.purge_later
    errors.add(:resource, 'needs to be an image')
  end
end
