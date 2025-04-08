class Artifact < ApplicationRecord
  acts_as_tenant :organization

  belongs_to :user#

  has_one_attached :artimg do |attachable|
    attachable.variant :thumb, resize_to_limit: [238, 238]
  end

  # mount_uploader :artifact, ArtifactUploader

  validates :name, presence: true
  validates :artimg, presence: true

  validate :artimg_size_limit

  private

  def artimg_size_limit
    return unless artimg.attached?
    if artimg.blob.byte_size > 5.megabytes
      errors.add(:artimg, "must be less than 1MB")
    end
  end


end
