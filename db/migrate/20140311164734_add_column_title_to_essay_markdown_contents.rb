class AddColumnTitleToEssayMarkdownContents < ActiveRecord::Migration
  def change
    add_column :essay_markdown_contents, :title, :string
  end
end
