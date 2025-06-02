class AddArtimgToArtifact < ActiveRecord::Migration[7.2]
  def change
    add_column :artifacts, :artimg, :string
  end
end
