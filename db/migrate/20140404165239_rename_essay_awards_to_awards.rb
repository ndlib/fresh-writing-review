class RenameEssayAwardsToAwards < ActiveRecord::Migration
  def up
    rename_table :essay_awards, :awards
  end

  def down
    rename_table :awards, :essay_awards
  end
end
