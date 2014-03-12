class MarkdownDetail

  def initialize(text)
    @text = text
  end


  def markdown
    MarkDownConverter.call(@text)
  end


  def present?
    @text.present?
  end


  def blank?
    @text.blank?
  end

end
