class Item < ApplicationRecord
  attr_accessor :upload # for file uploads
  belongs_to :project

  MAX_FILE_SIZE = 10.megabytes

  validate_presence_of :name, :upload
  validates_uniqueness_of :name

  validate :upload_file_size

  private

  def upload_to_gcs
  end

  def upload_file_size
    if upload.size > MAX_FILE_SIZE
      errors.add(:upload, "File size exceeds the maximum limit of #{MAX_FILE_SIZE / 1.megabyte} MB")
    end
  rescue NoMethodError
    # Handle the case where upload is nil or not an object with size method
    errors.add(:upload, "Invalid file upload")
  end
end
