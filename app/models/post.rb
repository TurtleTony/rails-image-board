class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :resource

  after_destroy :purge_resource

  private

  def purge_resource
    resource.purge
  end
end
