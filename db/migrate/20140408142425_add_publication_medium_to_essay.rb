class AddPublicationMediumToEssay < ActiveRecord::Migration
  def change
    add_column :essays, :published_medium, :string
  end
end
