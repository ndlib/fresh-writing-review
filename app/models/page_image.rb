class PageImage < ActiveRecord::Base

  self.table_name = 'pages_images'

  has_attached_file :image, :content_type => { :content_type => ["image/jpg", "image/gif", "image/png"] }

  validates_attachment_content_type :image, :content_type => /\Aimage/
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]

end
