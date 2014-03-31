class MarkdownContent < ActiveRecord::Base

  has_many :markdown_content_image
  has_many :images, through: :markdown_content_image

  validates :content, presence: true

end
