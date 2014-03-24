class AddAuthorBiographyToEssay < ActiveRecord::Migration
  def change
    add_column :essays, :author_biography_id, :integer
    add_index :essays, :author_biography_id
  end
end
