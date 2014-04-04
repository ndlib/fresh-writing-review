class AttachedFile < ActiveRecord::Base
  belongs_to :essay

  has_attached_file :file

  do_not_validate_attachment_file_type :file
end
