class RestoreActiveOrgToOrganizations < ActiveRecord::Migration[7.2]
  def change
    add_column :organizations, :active_org, :boolean, default: false, null: true
  end
end
