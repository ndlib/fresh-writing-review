class HighlightedEssayQuery
  def self.for_issue_and_essay_style(issue, essay_style)
    issue.highlighted_essays.where(essay_style: essay_style).first
  end

  def self.relation
    HighlightedEssay.all
  end
end
