class AttachedFile < ActiveRecord::Base
  has_many :essay_files

  has_attached_file :file

  do_not_validate_attachment_file_type :file
end
