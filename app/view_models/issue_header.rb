class IssueHeader
  include RailsHelpers

  def self.render(issue, show_full_image)
    self.new(issue, show_full_image).render
  end

  attr_accessor :issue

  def initialize(issue, show_full_image)
    @issue = issue
    @show_full_image = show_full_image
  end


  def css_class
    if @show_full_image
      'home'
    else
      'sub'
    end
  end


  def image
    if @show_full_image
      helpers.image_tag issue.large_cover_image.url(:large), alt: issue.cover_image_alt
    else
      helpers.image_tag issue.small_cover_image.url(:large), alt: issue.cover_image_alt
    end
  end


  def title
    helpers.link_to(issue.title, routes.issue_path(issue.friendly_id), class: 'vtitle')
  end


  def header_image
    helpers.link_to(image, routes.issue_path(issue.friendly_id))
  end


  def image_credit
    issue.cover_image_credit
  end


  def render
    return render_to_string('/issues/header', { object: self })
  end



end
