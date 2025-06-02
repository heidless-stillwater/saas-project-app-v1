class AddDomainInfoToOrganization < ActiveRecord::Migration[7.2]
  def change   
    add_column :organizations, :domain, :string, null: true 
    add_column :organizations, :subdomain, :string, null: true 
  end
end
