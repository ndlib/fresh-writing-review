class EssaySearchRow

  include RailsHelpers

  attr_accessor :essay

  def self.render(essay)
    self.new(essay).render
  end

  def initialize(essay)
    @essay = essay
  end


  def link_to_image
    LinkToRouteWithImage.call(routes.issue_essay_path(essay.issue.friendly_id, essay.friendly_id), essay.title, essay.id)
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
    render_to_string '/search/row', object: self
  end
end
