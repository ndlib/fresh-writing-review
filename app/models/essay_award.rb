class EssayAward < ActiveRecord::Base
  belongs_to :essay
  belongs_to :award

  def placement_string
    if placement.present?
      placement.ordinalize
    else
      nil
    end
  end
end
