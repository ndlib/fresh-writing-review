
class Essay < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :issue

  validates :title, presence: true

  store :data, accessors: [ :body, :title, :embed, :template, :alt_body, :alt_title, :author, :author_biography ]
end
