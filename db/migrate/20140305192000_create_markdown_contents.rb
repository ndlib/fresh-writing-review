class CreateMarkdownContents < ActiveRecord::Migration
  def change
    create_table 'markdown_contents' do | t |
      t.text :data
      t.timestamps
    end
  end
end
