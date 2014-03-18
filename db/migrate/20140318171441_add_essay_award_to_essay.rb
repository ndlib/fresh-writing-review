class AddEssayAwardToEssay < ActiveRecord::Migration
  def change
    add_column :essays, :essay_award_id, :integer
    add_index :essays, :essay_award_id
  end
end
