class EssayAward < ActiveRecord::Base
  belongs_to :essay
  belongs_to :award

  before_validation :set_default_placement

  validates_presence_of :essay, :award

  def placement_string
    if placement.present?
      placement.ordinalize
    else
      nil
    end
  end

  def title
    if award.present?
      "#{award.title}: #{placement_string}"
    else
      "Award: #{placement_string}"
    end
  end

  private

    def set_default_placement
      self.placement ||= 1
    end
end
