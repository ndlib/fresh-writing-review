class CreateJoinTableEssayImage < ActiveRecord::Migration
  def change
    create_join_table :essays, :images do |t|
      t.index [:essay_id, :image_id]
      t.index [:image_id, :essay_id]
    end
  end
end
