class CreateIssues < ActiveRecord::Migration
  def change

    create_table 'issues' do | t |
      t.integer :year
      t.string :slug
      t.string :title
      t.boolean :published
      t.boolean :is_pdf
      t.timestamps
    end

    add_index :issues, :slug, unique: true
  end
end
