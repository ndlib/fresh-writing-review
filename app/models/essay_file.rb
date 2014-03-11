class EssayFile < ActiveRecord::Base

  belongs_to :essay
  belongs_to :attached_file

end
