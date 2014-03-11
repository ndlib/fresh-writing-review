class EssayDetail::Embed
  include RailsHelpers

  attr_accessor :essay

  def self.render(essay)
    self.new(essay).render
  end

  delegate :embed, to: :essay

  def initialize(essay)
    @essay = essay
  end


  def render
    if display_embed?
      return render_to_string('/essays/embed', { object: self })
    end

    ""
  end


  protected

    def display_embed?
      @essay.embed.present?
    end

end
