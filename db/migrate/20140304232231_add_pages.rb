class AddPages < ActiveRecord::Migration
  def change
    create_table 'pages' do | t |
      t.text :data
      t.attachment :image
    end
  end
end
