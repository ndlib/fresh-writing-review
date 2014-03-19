class Image < ActiveRecord::Base
  has_many :markdown_contents_images

  has_attached_file :image

  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)
  validates :image, presence: true
end
