class RemoveOldEssayAwardFields < ActiveRecord::Migration
  def up
    remove_column :essays, :essay_award_id
    remove_column :essays, :placement
  end

  def down
    add_column :essays, :essay_award_id, :integer
    add_column :essays, :placement, :integer

    add_index :essays, :essay_award_id
  end
end
