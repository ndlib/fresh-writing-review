class MarkdownDetail
  attr_reader :markdown_content
  def initialize(markdown_content)
    @markdown_content = markdown_content
  end


  def markdown
    MarkDownConverter.call(content)
  end

  def to_html
    content.html_safe
  end

  def present?
    content.present?
  end


  def blank?
    content.blank?
  end

  def content
    if markdown_content.present?
      markdown_content.content
    else
      nil
    end
  end

end
