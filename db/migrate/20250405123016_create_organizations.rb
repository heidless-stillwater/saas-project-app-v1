class CreateOrganizations < ActiveRecord::Migration[7.2]
  def change
    create_table :organizations do |t|
      t.references :user, null: true, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
