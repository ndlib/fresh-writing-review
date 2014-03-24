class AddWorksCitedToEssay < ActiveRecord::Migration
  def change
    add_column :essays, :works_cited_id, :integer
    add_index :essays, :works_cited_id
  end
end
