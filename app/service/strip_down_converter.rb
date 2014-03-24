class StripDownConverter

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
    require 'redcarpet/render_strip'
    render_object = Redcarpet::Render::StripDown.new()
    @renderer ||= Redcarpet::Markdown.new(render_object, :autolink => true, :space_after_headers => true)
  end

end
