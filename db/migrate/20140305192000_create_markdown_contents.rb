class CreateMarkdownContents < ActiveRecord::Migration
  def change
    create_table 'markdown_contents' do | t |
      t.text :content
      t.timestamps
    end

    change_column :markdown_contents, :content, :text, :limit => 4294967295
  end
end
