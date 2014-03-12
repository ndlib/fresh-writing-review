class MarkdownContentImage < ActiveRecord::Base
  belongs_to :markdown_content
  belongs_to :image
end
