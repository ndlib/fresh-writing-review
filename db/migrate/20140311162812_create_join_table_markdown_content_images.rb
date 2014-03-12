class CreateJoinTableMarkdownContentImages < ActiveRecord::Migration
  def change
    create_join_table :markdown_contents, :images, table_name: 'markdown_content_images' do |t|
      t.index [:markdown_content_id, :image_id], :name => 'md_image_index'
      t.index [:image_id, :markdown_content_id], :name => 'image_md_index'
    end
  end
end
