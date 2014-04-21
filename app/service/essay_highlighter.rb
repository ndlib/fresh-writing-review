class EssayHighlighter
  def self.highlight(essay)
    self.new(essay).highlight
  end

  def self.unhighlight(essay)
    self.new(essay).unhighlight
  end

  attr_reader :essay

  def initialize(essay)
    @essay = essay
  end

  def highlight
    highlighted_essay = @essay.highlighted_essay || @essay.build_highlighted_essay
    highlighted_essay.essay_style = @essay.essay_style
    highlighted_essay.issue = @essay.issue
    highlighted_essay.save!
  end

  def unhighlight
    if @essay.highlighted_essay
      @essay.highlighted_essay.destroy
    end
    true
  end

end
