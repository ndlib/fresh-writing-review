class MarkdownDetail

  def initialize(markdown_content)
    @markdown_content = markdown_content
  end


  def markdown
    MarkDownConverter.call(@markdown_content.content)
  end


  def present?
    !@markdown_content.nil? && @markdown_content.content.present?
  end


  def blank?
    markdown_content.nil? || @markdown_content.content.blank?
  end

end
