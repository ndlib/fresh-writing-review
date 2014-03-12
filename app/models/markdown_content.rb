class MarkdownContent < ActiveRecord::Base

  has_many :markdown_content_image
  has_many :images, through: :markdown_content_image

  store :data, accessors: [ :content ]

end
