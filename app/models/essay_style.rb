class EssayStyle < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  store :data, accessors: [ :title ]
end
