class AddEmbedToEssay < ActiveRecord::Migration
  def change
    add_column :essays, :embed_id, :integer
    add_index :essays, :embed_id
  end
end
