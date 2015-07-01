class EssayDetail::WowzaMedia
  include RailsHelpers

  attr_accessor :essay

  def self.render(essay)
    self.new(essay).render
  end

  # delegate :wowza_media, to: :essay

  def initialize(essay)
    @essay = essay
  end

  def has_content?
    markdown_object.present?
  end

  def markdown
    markdown_object.markdown
  end


  def to_html
    markdown_object.to_html
  end

  def render
    return render_to_string('/essays/wowza_media', { object: self })
  end

  protected


  def markdown_object
    @markdown_object ||= MarkdownDetail.new(essay.wowza_media)
  end

end
