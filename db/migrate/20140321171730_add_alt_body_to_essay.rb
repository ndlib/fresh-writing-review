class AddAltBodyToEssay < ActiveRecord::Migration
  def change
    add_column :essays, :alt_body_id, :integer
    add_index :essays, :alt_body_id
  end
end
