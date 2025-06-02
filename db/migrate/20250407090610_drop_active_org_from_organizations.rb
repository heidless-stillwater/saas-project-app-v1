class DropActiveOrgFromOrganizations < ActiveRecord::Migration[7.2]
  def change
    remove_column(:organizations, :active_org, if_exists: true)
  end
end
