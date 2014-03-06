
class Essay < ActiveRecord::Base
  belongs_to :issue

  store :data, accessors: [ :body, :title, :embed, :template, :slug, :alt_body, :alt_title, :author, :author_biography ]
end
