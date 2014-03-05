
class Essay < ActiveRecord::Base
  belongs_to :issue

  store :data, accessors: [ :body, :title, :images, :embed ]
end
