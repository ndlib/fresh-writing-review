class AttachedFile < ActiveRecord::Base
  belongs_to :essay

  has_attached_file :file

  do_not_validate_attachment_file_type :file
  validates_attachment_presence :file
  validates_presence_of :title
end
