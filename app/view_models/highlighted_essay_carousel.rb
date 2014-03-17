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
    MarkDownConverter.call(highlighted_essay.body)
  end

  def biography(highlighted_essay)
    MarkDownConverter.call(highlighted_essay.biography)
  end

  private

    def issue
      @issue
    end
end

