class CreateJoinTableMarkdownContentsImage < ActiveRecord::Migration
  def change
    create_join_table :markdown_contents, :images do |t|
      t.index [:markdown_content_id, :image_id], :name => 'md_image_index'
      t.index [:image_id, :markdown_content_id], :name => 'image_md_index'
    end
  end
end
