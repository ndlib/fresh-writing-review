class CreateEditors < ActiveRecord::Migration
  def change
    create_table :editors do |t|
      t.string :username
      t.boolean :is_superuser
      t.timestamps
    end

    add_index :editors, :username
  end
end
