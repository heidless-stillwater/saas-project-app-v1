class AddOrganizationAsTenancy < ActiveRecord::Migration[7.2]
  def change
    # users
    add_column :users, :organization_id, :integer
    add_index :users, :organization_id

    # payments
    add_column :payments, :organization_id, :integer
    add_index :payments, :organization_id

    # artifacts
    add_column :artifacts, :organization_id, :integer
    add_index :artifacts, :organization_id
  end
end
