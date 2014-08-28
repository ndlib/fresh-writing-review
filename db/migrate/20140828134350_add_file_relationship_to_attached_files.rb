class AddFileRelationshipToAttachedFiles < ActiveRecord::Migration
  def change
    add_column :attached_files, :file_relationship, :string
  end
end
