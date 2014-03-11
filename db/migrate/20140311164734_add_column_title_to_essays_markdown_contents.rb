class AddColumnTitleToEssaysMarkdownContents < ActiveRecord::Migration
  def change
    add_column :essays_markdown_contents, :title, :string
  end
end
