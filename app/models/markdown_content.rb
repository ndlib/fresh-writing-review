class MarkdownContent < ActiveRecord::Base

  attr_accessor :component_parent, :component_parent_id

  has_many :markdown_content_image
  has_many :images, through: :markdown_content_image

  validates :content, presence: true

end
