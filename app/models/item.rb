class Item < ApplicationRecord
  belongs_to :project

  has_one_attached :item_img do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 238, 238 ]
  end
end
