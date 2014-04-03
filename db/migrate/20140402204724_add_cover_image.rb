class AddCoverImage < ActiveRecord::Migration
  def change
    add_attachment :issues, :large_cover_image
    add_attachment :issues, :small_cover_image

    add_column :issues, :cover_image_credit, :string
    add_column :issues, :cover_image_alt, :string
  end
end
