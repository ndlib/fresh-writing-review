class HighlightedEssayQuery
  def self.for_issue_and_essay_style(issue, essay_style)
    relation.where(issue: issue, essay_style: essay_style).first
  end

  def self.for_issue(issue)
    relation.where(issue: issue)
  end

  def self.relation
    HighlightedEssay.all
  end
end
