class HighlightedEssayCarousel

  include RailsHelpers

  def initialize(issue)
    @issue = issue
  end

  def render
    if highlighted_essays.present?
      render_to_string 'issues/highlighted_essay_carousel', highlighted_essay_carousel: self
    else
      nil
    end
  end


  def hightlighed_cover_image(highlighted_essay)
    helpers.link_to(helpers.image_tag(highlighted_essay.essay.cover_image.url(:highlight)), routes.issue_essay_path(issue.friendly_id, highlighted_essay.friendly_id))
  end


  def highlighted_author(highlighted_essay)
    "by #{highlighted_essay.author}"
  end


  def highlighted_essay_style(highlighted_essay)
    highlighted_essay.essay_style.title
  end

  def highlighted_essays
    @highlighted_essays ||= HighlightedEssayQuery.for_issue(issue)
  end

  def link_to_essay(highlighted_essay)
    helpers.link_to(highlighted_essay.title, routes.issue_essay_path(issue.friendly_id, highlighted_essay.friendly_id), class: "title")
  end

  def body(highlighted_essay)
    "<p>" + StripDownConverter.call(highlighted_essay.essay.body.content).scan(/.{1,250}\b/m).first.strip + "...</p>"
  end

  private

    def issue
      @issue
    end
end

