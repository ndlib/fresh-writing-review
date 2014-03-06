class CreateIssues < ActiveRecord::Migration
  def change

    create_table 'issues' do | t |
      t.integer :year
      t.text :data
      t.timestamps
    end


  end
end
