class AlterEssayCoverImageCreditTypeToText < ActiveRecord::Migration
  def change
    change_column :essays, :cover_image_credit, :text
  end
end
