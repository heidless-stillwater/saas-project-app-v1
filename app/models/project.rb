class Project < ApplicationRecord
  acts_as_tenant :organization

  belongs_to :organization
  has_one_attached :image  # for single image uploads

  validates_uniqueness_of :name, scope: :organization_id
  validates :name, presence: true

  MAX_NUM_PLANS = 2
  validate :free_plan_can_only_have_one_project

  def free_plan_can_only_have_one_project
    if self.new_record? && (organization.projects.count > (MAX_NUM_PLANS - 1)) && (organization.plan == "free")
      errors.add(:base, "Free plan can only have one project.")
    end
  end
end
