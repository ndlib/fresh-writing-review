class AttachedFile < ActiveRecord::Base
  has_many :essay_files

  has_attached_file :file
end
