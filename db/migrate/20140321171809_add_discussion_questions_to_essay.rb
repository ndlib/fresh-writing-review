class AddDiscussionQuestionsToEssay < ActiveRecord::Migration
  def change
    add_column :essays, :discussion_questions_id, :integer
    add_index :essays, :discussion_questions_id
  end
end
