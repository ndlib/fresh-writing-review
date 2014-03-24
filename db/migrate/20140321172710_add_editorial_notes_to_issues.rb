class AddEditorialNotesToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :editorial_notes_id, :integer
    add_index :issues, :editorial_notes_id
  end
end
