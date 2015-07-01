class AddWowzaMedia < ActiveRecord::Migration
  def change
    add_column :essays, :wowza_media_id, :integer
    add_index :essays, :wowza_media_id
  end
end
