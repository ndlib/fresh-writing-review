class AddEssays < ActiveRecord::Migration
  def change

    create_table "essays" do | t |
      t.integer :issue_id
      t.text :data
    end
  end
end
