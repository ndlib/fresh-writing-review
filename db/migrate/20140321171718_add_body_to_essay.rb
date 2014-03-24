class AddBodyToEssay < ActiveRecord::Migration
  def change
    add_column :essays, :body_id, :integer
    add_index :essays, :body_id
  end
end
