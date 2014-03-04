class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :issue_id
      t.string :slug
      t.text :data
      t.timestamps
    end

    add_index :pages, :issue_id
    add_index :pages, :slug
  end
end
