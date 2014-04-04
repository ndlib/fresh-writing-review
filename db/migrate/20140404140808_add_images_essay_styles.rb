class AddImagesEssayStyles < ActiveRecord::Migration
  def change
    add_attachment :essay_styles, :cover_image
  end
end
