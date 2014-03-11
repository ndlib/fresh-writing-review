class CreateAttachedFiles < ActiveRecord::Migration
  def change
    create_table :attached_files do |t|
    end

    add_attachment :attached_files, :file
  end
end
