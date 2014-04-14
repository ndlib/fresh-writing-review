class AddBodyToEssayStyle < ActiveRecord::Migration
  def change
    add_column :essay_styles, :body_id, :integer
    add_index :essay_styles, :body_id
  end
end
