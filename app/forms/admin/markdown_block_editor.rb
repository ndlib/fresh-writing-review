class Admin::MarkdownBlockEditor
  include RailsHelpers

  attr_accessor :markdown_block, :markdown_content, :images

  # questions
  # should we sanitize the markdown content?


  def initialize(markdown)
    @markdown_block = markdown
    @markdown_content = markdown.content
    @images = markdown.images
  end


  def add_image(image)
    @markdown_block.images.create(:image => image)
  end


  def remove_image(image)
    @markdown_block.images.find(image).destroy
  end

end
