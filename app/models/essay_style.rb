class EssayStyle < ActiveRecord::Base
  extend FriendlyId
  friendly_id :lower_title, use: :slugged
  store :data, accessors: [ :title ]

  def lower_title
    title.to_s.downcase
  end
end
