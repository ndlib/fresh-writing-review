

class EssayQuery

  def self.find(id)
    relation.friendly.find(id)
  end

  # question: why is this method necessary? (RJF)
  def self.essay_for_issue_from_url(issue_id, id)
    issue = IssueQuery.find(issue_id)
    issue.essays.friendly.find(id)
  end


  def self.essays_for_issue_and_essay_style(issue_id, essay_style)
    issue = IssueQuery.find(issue_id)
    issue.essays.where(essay_style: essay_style)
  end


  def self.essays_for_issue(issue)
    issue.essays
  end


  def self.essays_for_issue_and_essay_award(issue_id, essay_award)
    issue = IssueQuery.find(issue_id)
    issue.essays.where(essay_award: essay_award).order(:placement)
  end


  def self.relation
    Essay.all
  end

end

