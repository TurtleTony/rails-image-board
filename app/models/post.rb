class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :resource

  validate :resource_format

  def belongs_to_user?(user)
    !user.nil? && user.id == user_id
  end

  def destroy_if_belongs_to_user(user)
    if belongs_to_user?(user)
      destroy
    else
      false
    end
  end

  private

  def resource_format
    return unless resource.attached?
    return if resource.blob.content_type.start_with? 'image/'

    resource.purge_later
    errors.add(:resource, 'needs to be an image')
  end
end
