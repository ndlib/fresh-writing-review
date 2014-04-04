class UpdateAttachedFilesEssayIds < ActiveRecord::Migration
  class EssayFile < ActiveRecord::Base
  end

  class AttachedFile < ActiveRecord::Base
    has_one :essay_file
  end

  def up
    AttachedFile.all.each do |attached_file|
      if essay_file = attached_file.essay_file
        attached_file.update_attribute(:essay_id, essay_file.essay_id)
      end
    end
  end

  def down
  end
end
