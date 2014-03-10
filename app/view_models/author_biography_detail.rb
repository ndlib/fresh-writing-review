class AuthorBiographyDetail
  include RailsHelpers

  def initialize(essay)
    @essay = essay
  end


  def markdown
    markdown_object.markdown
  end


  def name
    @essay.author
  end


  def image
    helpers.image_tag 'author.jpg', width:'50px'
  end


  def present?
    markdown_object.present?
  end


  private

    def markdown_object
      @markdown_object ||= MarkdownDetail.new(@essay.author_biography)
    end

end
