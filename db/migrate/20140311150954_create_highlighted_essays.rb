class CreateHighlightedEssays < ActiveRecord::Migration
  def change
    create_table :highlighted_essays do |t|
      t.integer :issue_id
      t.integer :essay_style_id
      t.integer :essay_id
      t.text :body
      t.timestamps
    end

    add_index :highlighted_essays, :issue_id
    add_index :highlighted_essays, :essay_style_id
    add_index :highlighted_essays, :essay_id
  end
end
