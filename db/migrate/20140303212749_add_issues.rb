class AddIssues < ActiveRecord::Migration
  def change

    create_table 'issues' do | t |
      t.integer :year
      t.text :data
    end


  end
end
