class EssayStyle < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  store :data, accessors: [ :title ]

  has_many :essays
end
