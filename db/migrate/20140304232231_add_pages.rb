class AddPages < ActiveRecord::Migration
  def change
    create_table 'pages' do | t |
      t.text :data
    end
  end
end
