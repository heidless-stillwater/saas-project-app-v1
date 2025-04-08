class AddActiveOrgToOrganizations < ActiveRecord::Migration[7.2]
  def change
    add_column :organizations, :active_org, :boolean, default: true, null: true
  end
end
