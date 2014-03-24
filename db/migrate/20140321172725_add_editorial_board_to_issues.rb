class AddEditorialBoardToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :editorial_board_id, :integer
    add_index :issues, :editorial_board_id
  end
end
