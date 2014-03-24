class AddInstructorResourcesToEssay < ActiveRecord::Migration
  def change
    add_column :essays, :instructor_resources_id, :integer
    add_index :essays, :instructor_resources_id
  end
end
