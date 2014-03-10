class MarkdownDetail


  def initialize(text)
    @text = text
  end


  def markdown
    MarkDownConverter.call(@text)
  end


  def present?(&block)
    @text.present?
  end


  def blank?(&block)
    @text.blank?
  end

end
