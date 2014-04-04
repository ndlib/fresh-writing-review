class DropEssayFiles < ActiveRecord::Migration
  def up
    drop_table :essay_files
  end

  def down
    create_table :essay_files do |t|
      t.integer :essay_id
      t.integer :attached_file_id
    end

    add_index :essay_files, [ :essay_id, :attached_file_id ]
  end
end
