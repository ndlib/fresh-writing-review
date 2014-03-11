class AddColumnTitleToEssaysImages < ActiveRecord::Migration
  def change
    add_column :essays_images, :title, :string
  end
end
