class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :cas_authenticatable, :trackable

  has_one :editor, foreign_key: :username, primary_key: :username

  def editor?
    editor.present?
  end

  def create_editor!
    self.editor = Editor.new(user: self, is_superuser: true)
    editor.save!
  end
end
