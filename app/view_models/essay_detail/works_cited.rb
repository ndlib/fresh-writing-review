class EssayDetail::WorksCited

  include RailsHelpers

  attr_accessor :essay

  def self.render(essay)
    self.new(essay).render
  end


  def initialize(essay)
    @essay = essay
  end


  def markdown
    markdown_object.markdown
  end


  def has_content?
    markdown_object.present?
  end


  def render
    if markdown_object.present?
      return render_to_string('/essays/works_cited', { object: self })
    end

    ""
  end

  protected

    def markdown_object
      @markdown_object ||= MarkdownDetail.new(essay.works_cited)
    end

end
