class AddEssayIdToAttachedFiles < ActiveRecord::Migration
  def change
    add_column :attached_files, :essay_id, :integer

    add_index :attached_files, :essay_id
  end
end
