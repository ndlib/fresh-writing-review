class Editor < ActiveRecord::Base
  belongs_to :user, foreign_key: :username, primary_key: :username

  validates_presence_of :username
  validates_uniqueness_of :username

  before_validation :strip_whitespace

  def strip_whitespace
    self.username = self.username.to_s.strip
  end
end
