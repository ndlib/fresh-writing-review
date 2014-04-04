class CreateNewEssayAwards < ActiveRecord::Migration
  def change
    create_table :essay_awards do |t|
      t.integer :essay_id
      t.integer :award_id
      t.integer :placement
    end

    add_index :essay_awards, :essay_id
    add_index :essay_awards, :award_id
  end
end
