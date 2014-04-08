class AddBioImageToEssays < ActiveRecord::Migration
  def change
    add_attachment :essays, :author_image
  end
end
