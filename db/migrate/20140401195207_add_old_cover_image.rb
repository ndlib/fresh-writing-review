class AddOldCoverImage < ActiveRecord::Migration
  def change
    add_attachment :issues, :old_cover_image
    add_attachment :issues, :pdf
  end
end
