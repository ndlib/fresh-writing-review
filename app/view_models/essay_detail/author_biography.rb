class EssayDetail::AuthorBiography
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
    markdown.present?
  end


  def name
    essay.author
  end


  def image
    helpers.image_tag essay.author_image.url(:small), alt: essay.author
  end


  def render
    if markdown_object.present?
      return render_to_string('/essays/author_biography', { object: self })
    end

    ""
  end

  private

    def markdown_object
      @markdown_object ||= MarkdownDetail.new(essay.author_biography)
    end

end
