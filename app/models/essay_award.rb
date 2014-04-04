class EssayAward < ActiveRecord::Base
  belongs_to :essay
  belongs_to :award

  before_validation :set_default_placement

  def placement_string
    if placement.present?
      placement.ordinalize
    else
      nil
    end
  end

  private

    def set_default_placement
      self.placement ||= 1
    end
end
