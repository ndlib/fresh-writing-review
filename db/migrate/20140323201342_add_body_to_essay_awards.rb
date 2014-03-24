class AddBodyToEssayAwards < ActiveRecord::Migration
  def change
    add_column :essay_awards, :body_id, :integer
    add_index :essay_awards, :body_id
  end
end
