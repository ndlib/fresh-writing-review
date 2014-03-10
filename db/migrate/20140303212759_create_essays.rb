class CreateEssays < ActiveRecord::Migration
  def change

    create_table "essays" do | t |
      t.integer :issue_id
      t.string :slug
      t.text :data
      t.timestamps
    end

    add_index :essays, :issue_id
    add_index :essays, :slug, unique: true

    change_column :essays, :data, :text, :limit => 4294967295
  end
end
