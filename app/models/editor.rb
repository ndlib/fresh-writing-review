class Editor < ActiveRecord::Base
  belongs_to :user, foreign_key: :username, primary_key: :username

  validates_presence_of :username
  validates_uniqueness_of :username
end
