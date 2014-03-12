class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :path, use: :slugged

  store :data, accessors: [ :body ]
end
