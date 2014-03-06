class CreateEssayStyles < ActiveRecord::Migration
  def change
    create_table :essay_styles do |t|
      t.string :slug
      t.text :data
      t.timestamps
    end

    add_index :essay_styles, :slug
  end
end
