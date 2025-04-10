class Organization < ApplicationRecord
  has_many :users
  has_many :projects, dependent: :destroy
  has_one_attached :logo  # for single image upload

  def can_create_projects?
    # Assuming you have a method to get the user's plan
    # debugger
    this_plan = Plan.find(plan_id)
    if this_plan.name == "free"
      projects.count < Project::MAX_NUM_PROJECTS
    else
      this_plan.name == "premium"
    end
  end
end
