class Image < ActiveRecord::Base
  has_many :markdown_contents_images

  has_attached_file :image, { :path => ":rails_root/uploads/images/:id/:filename" }
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)
end
