class AddAcknowledgementsToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :acknowledgements_id, :integer
    add_index :issues, :acknowledgements_id
  end
end
