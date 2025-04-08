class CreatePlans < ActiveRecord::Migration[7.2]
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :amount
      t.string :symbol
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
