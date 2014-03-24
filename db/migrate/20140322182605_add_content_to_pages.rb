class AddContentToPages < ActiveRecord::Migration
  def change
    add_column :pages, :content_id, :integer
    add_index :pages, :content_id
  end
end
