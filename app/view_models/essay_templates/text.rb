class EssayTemplates::Text

  include RailsHelpers

  attr_accessor :essay
  delegate :alt_title, to: :essay

  def initialize(essay)
    @essay = essay
  end


  def body
    MarkDownConverter.call(@essay.body)
  end


  def alt_body
    MarkDownConverter.call(@essay.alt_body)
  end


  def render
    render_to_string('/essays/text_template', { object: self })
  end


  def alternate_body(&block)
    if show_alt_body?
      yield
    end
  end


  protected

    def show_alt_body?
      @essay.alt_body.present?
    end



end
