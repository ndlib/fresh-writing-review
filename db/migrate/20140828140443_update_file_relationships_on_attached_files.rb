class UpdateFileRelationshipsOnAttachedFiles < ActiveRecord::Migration
  class AttachedFile < ActiveRecord::Base
  end

  def up
    AttachedFile.update_all(["file_relationship = ?", "companion_material"])
  end

  def down
  end
end
