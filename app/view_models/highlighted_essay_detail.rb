class HighlightedEssayDetail

  include RailsHelpers

  delegate :title, :author, to: :highlighted_essay
  delegate :present?, :blank?, to: :highlighted_essay

  def initialize(issue, essay_style)
    @essay_style = essay_style
    @issue = issue
    @highlighted_essay = HighlightedEssayQuery.for_issue_and_essay_style(issue, essay_style)
  end

  def image_path
    "http://placehold.it/211x135"
  end

  def link_to_essay
    helpers.link_to(highlighted_essay.title, routes.issue_essay_path(issue.friendly_id, highlighted_essay.friendly_id))
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

