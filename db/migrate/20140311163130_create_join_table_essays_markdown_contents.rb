class CreateJoinTableEssaysMarkdownContents < ActiveRecord::Migration
  def change
    create_join_table :essays, :markdown_contents do |t|
      # t.index [:essay_id, :markdown_content_id]
      # t.index [:markdown_content_id, :essay_id]
    end
  end
end
