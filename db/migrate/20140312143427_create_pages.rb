class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :path
      t.string :slug
      t.text :data
      t.timestamps
    end

    add_index :pages, :slug, unique: true
  end
end
