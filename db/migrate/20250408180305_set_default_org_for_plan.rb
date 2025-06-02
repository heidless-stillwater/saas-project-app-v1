class SetDefaultOrgForPlan < ActiveRecord::Migration[7.2]
  def change
    change_column :plans, :organization_id, :bigint, default: 1
  end
end
