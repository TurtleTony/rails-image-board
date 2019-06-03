class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :resource

  validate :main_picture_format

  private

  def main_picture_format
    return unless resource.attached?
    return if resource.blob.content_type.start_with? 'image/'

    resource.purge_later
    errors.add(:main_picture, 'needs to be an image')
  end
end
