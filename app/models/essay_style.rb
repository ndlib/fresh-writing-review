class EssayStyle < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  store :data, accessors: [ :title ]

  has_many :essays
  has_many :highlighted_essays
end
