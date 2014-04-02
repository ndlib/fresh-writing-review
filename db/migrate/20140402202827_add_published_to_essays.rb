class AddPublishedToEssays < ActiveRecord::Migration
  def change
    add_column :essays, :published, :boolean
  end
end
