class AddImagesEssayAwards < ActiveRecord::Migration
  def change
    add_attachment :essay_awards, :cover_image
  end
end
