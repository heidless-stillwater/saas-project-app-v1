class Plan < ApplicationRecord
  belongs_to :organization
  has_one_attached :symbol
end
