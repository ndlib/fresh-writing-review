class AddEssayStyleIdToEssays < ActiveRecord::Migration
  def change
    add_column :essays, :essay_style_id, :integer
    add_index :essays, :essay_style_id
  end
end
