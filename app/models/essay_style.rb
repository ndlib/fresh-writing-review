  class EssayStyle < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :essays
  has_many :highlighted_essays
end
