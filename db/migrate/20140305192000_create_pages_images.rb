class CreatePagesImages < ActiveRecord::Migration
  def change
    create_table :pages_images do |t|
      t.integer :page_id
      t.attachment :image
      t.timestamps
    end
    add_index :pages_images, :page_id
  end
end
