class CreateEssayAwards < ActiveRecord::Migration
  def change
    create_table :essay_awards do |t|
      t.string :slug
      t.string :title
      t.text :data
      t.timestamps
    end
  end
end
