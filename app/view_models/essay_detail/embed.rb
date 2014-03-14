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


  def transcript_link
    helpers.link_to('Transcript', routes.transcript_issue_essay_path(essay.issue.friendly_id, essay.friendly_id))
  end


  def render
    if display_embed?
      return render_to_string('/essays/embed', { object: self })
    else
      return render_to_string('/essays/coverimage', { object: self })
    end
  end


  protected

    def display_embed?
      @essay.embed.present?
    end

end
