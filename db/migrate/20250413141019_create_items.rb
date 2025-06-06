class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
