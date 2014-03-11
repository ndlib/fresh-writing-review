class EssayDetail::Media
  include RailsHelpers

  attr_accessor :essay
  delegate :alt_title, to: :essay

  def initialize(essay)
    @essay = essay
  end


  def embed
    helpers.raw @essay.embed
  end


  def body
    MarkDownConverter.call(@essay.body)
  end


  def transcript_link
    if show_transcript?
      helpers.link_to "Transcript", "#"
    end
  end


  def render
    render_to_string('/essays/media_template', { object: self })
  end


  protected

    def show_transcript?
      @essay.alt_body.present?
    end

end
