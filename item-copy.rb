class Item < ApplicationRecord
  attr_accessor :upload # for file uploads
  belongs_to :project

  MAX_FILE_SIZE = 10.megabytes

  validates_presence_of :name, :upload
  validates_uniqueness_of :name

  validate :upload_file_size

  private

  def upload_item_to_gcs(file, directory_name)
    profile_picture.attach(
      io: file,
      filename: file.original_filename,
      content_type: file.content_type,
      key: "#{directory_name}/#{file.original_filename}"
    )
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
