class HighlightedEssayDetail

  include RailsHelpers

  delegate :title, :author, to: :highlighted_essay
  delegate :present?, :blank?, to: :highlighted_essay

  def initialize(issue, essay_style)
    @essay_style = essay_style
    @issue = issue
    @highlighted_essay = HighlightedEssayQuery.for_issue_and_essay_style(issue, essay_style)
  end

  def link_to_essay
    LinkToRouteWithImage.call(routes.issue_essay_path(issue.friendly_id, highlighted_essay.friendly_id), highlighted_essay.title, highlighted_essay.id)
  end

  def body
    MarkDownConverter.call(highlighted_essay.body)
  end

  def biography
    MarkDownConverter.call(highlighted_essay.biography)
  end

  def essay_id
    highlighted_essay.essay_id
  end

  private

    def issue
      @issue
    end

    def essay_style
      @essay_style
    end

    def highlighted_essay
      @highlighted_essay
    end
end

