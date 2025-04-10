class Organization < ApplicationRecord
  has_many :users
  has_many :projects, dependent: :destroy
  has_one_attached :logo  # for single image upload
end
