class Page < ActiveRecord::Base
  belongs_to :issue

  store :data, accessors: [ :body, :title ]
end
