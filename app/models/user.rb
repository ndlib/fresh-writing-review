class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, omniauth_providers: [:oktaoauth]

  has_one :editor, foreign_key: :username, primary_key: :username

  def editor?
    editor.present?
  end

  def is_superuser?
    editor.present? && editor.is_superuser?
  end

  def create_editor!
    self.editor = Editor.new(user: self, is_superuser: true)
    editor.save!
  end
end
