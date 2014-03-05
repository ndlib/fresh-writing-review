class CreatePages < ActiveRecord::Migration
  def change
    create_table 'pages' do | t |
      t.text :data
      t.timestamps
    end
  end
end
