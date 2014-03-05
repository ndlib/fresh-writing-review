class CreatePagesImages < ActiveRecord::Migration
  def change
    create_table :pages_images do |t|
      t.integer :page_id
      t.attachment :image
      t.timestamps
    end
  end
end
