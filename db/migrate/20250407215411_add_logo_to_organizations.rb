class AddLogoToOrganizations < ActiveRecord::Migration[7.2]
  def change
    add_column :organizations, :logo, :string
  end
end
