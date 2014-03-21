class MarkDownConverter

  include RailsHelpers

  def self.call(text)
    self.new(text).convert
  end


  def initialize(text)
    @text = text.to_s
  end


  def convert
    helpers.raw renderer.render(@text)
  end


  def renderer
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(:hard_wrap => true), :autolink => true, :space_after_headers => true)
  end
end
