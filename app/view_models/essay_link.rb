class EssayLink

  include RailsHelpers

  attr_reader :essay, :show_volume_style_links

  def self.render(essay, show_volume_style_links = true)
    self.new(essay, show_volume_style_links).render
  end

  def initialize(essay, show_volume_style_links = true)
    @essay = essay
    @show_volume_style_links = show_volume_style_links
  end


  def link_to_image
    LinkToRouteWithImage.call(routes.issue_essay_path(essay.issue.friendly_id, essay.friendly_id), essay.title, essay.cover_image.url(:small))
  end


  def author
    "By #{essay.author}"
  end


  def link_to_issue
    helpers.link_to essay.issue.title, routes.issue_path(essay.issue.friendly_id)
  end


  def link_to_style
    helpers.link_to(essay.essay_style.title, routes.issue_essay_style_path(essay.issue.friendly_id, essay.essay_style.friendly_id))
  end


  def render
    render_to_string '/essays/link', object: self, show_volume_style_links: show_volume_style_links
  end
end
