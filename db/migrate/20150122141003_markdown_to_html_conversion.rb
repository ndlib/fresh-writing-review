class MarkdownToHtmlConversion < ActiveRecord::Migration
  def up
    MarkdownContent.all.each do |content|
      content.content =  MarkDownConverter.call(content.content)
      content.save
    end
  end

  def down
  end
end
