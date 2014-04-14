class Image < ActiveRecord::Base
  
  has_many :markdown_contents_images

  has_attached_file :image, { :styles => {:small => '329'}, :path => ":rails_root/public/system/:class/:id/:style/:filename", :url => "/system/:class/:id/:style/:filename" }
  
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)
  validates :image, presence: true

end
