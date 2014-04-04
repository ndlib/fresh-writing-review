class AddImagesToEssays < ActiveRecord::Migration
  def change
    add_attachment :essays, :cover_image

    add_column :essays, :cover_image_credit, :string
    add_column :essays, :cover_image_alt, :string
  end
end
