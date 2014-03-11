class EssayHeader
  include RailsHelpers

  delegate :title, :author, to: :essay

  attr_accessor :essay


  def self.render(essay)
    self.new(essay).render
  end


  def initialize(essay)
    @essay = essay
  end


  def author
    helpers.raw "By #{helpers.link_to(@essay.author, "#author_biography")}"
  end


  def issue_link
    helpers.link_to(essay.issue.year, routes.issue_path(essay.issue.friendly_id))
  end


  def essay_style_link
    helpers.link_to(essay.essay_style.title, routes.issue_essay_style_path(essay.issue.friendly_id, essay.essay_style.friendly_id))
  end


  def render
    render_to_string('/essays/header', { object: self })
  end

end
