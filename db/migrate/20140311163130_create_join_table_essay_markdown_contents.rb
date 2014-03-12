class CreateJoinTableEssayMarkdownContents < ActiveRecord::Migration
  def change
    create_join_table :essays, :markdown_contents, table_name: 'essay_markdown_contents' do |t|
      t.index [:essay_id, :markdown_content_id], name: 'essay_md_content'
      t.index [:markdown_content_id, :essay_id], name: 'md_content_essay'
    end
  end
end
