class Project < ApplicationRecord
  acts_as_tenant :organization

  belongs_to :organization
  belongs_to :user, optional: true

  has_one_attached :image  # for single image uploads
  has_many :items, dependent: :destroy # for multiple items

  validates_uniqueness_of :name, scope: :organization_id
  # validates :name, presence: true

  MAX_NUM_PROJECTS = 3
  validate :free_plan_can_only_have_one_project

  def free_plan_can_only_have_one_project
    # debugger
    this_plan = Plan.find(organization.plan_id)
    if self.new_record? && (organization.projects.count > (MAX_NUM_PROJECTS - 1)) && (this_plan.name == "free")
      errors.add(:base, "Free plan can only have #{MAX_NUM_PROJECTS} project(s)")
    end
  end

  def self.by_plan_and_user(user_id)
    # Assuming you have a method to get the user's plan
    user = User.find(user_id)
    if user.plan == "premium"
      user.projects
    else
      user.projects.order(:id).limit(1)
    end
  end

  def self.by_user(user_id)
    where(user_id: user_id)
  end

  def self.by_organization(organization_id)
    where(organization_id: organization_id)
  end

  def self.by_user_and_organization(user_id, organization_id)
    where(user_id: user_id, organization_id: organization_id)
  end
end
