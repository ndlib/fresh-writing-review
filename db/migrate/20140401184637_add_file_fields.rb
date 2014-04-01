class AddFileFields < ActiveRecord::Migration
  def change
    add_column :attached_files, :title, :string
    add_column :attached_files, :body, :text
  end
end
