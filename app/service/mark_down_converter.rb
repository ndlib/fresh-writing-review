

class MarkDownConverter


  def self.call(text)
    self.new(text).convert
  end


  def initialize(text)
    @text = text
  end


  def convert
    renderer.render(@text)
  end


  def renderer
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
  end

end
