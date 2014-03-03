class AddEssays < ActiveRecord::Migration
  def change

    create_table "essays" do | t |
      t.text :data
    end
  end
end
