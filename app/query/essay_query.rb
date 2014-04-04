

class EssayQuery

  def self.find(id)
    relation.friendly.find(id)
  end

  # question: why is this method necessary? (RJF)
  def self.essay_for_issue_from_url(issue_id, id)
    issue = IssueQuery.find(issue_id)
    issue.essays.friendly.find(id)
  end


  def self.published_essays_for_issue_and_essay_style(issue_id, essay_style)
    issue = IssueQuery.find(issue_id)
    issue.essays.where(published: true, essay_style: essay_style)
  end


  def self.essays_for_issue(issue)
    relation.where(issue_id: issue.id).order(title: :asc)
  end

  def self.published_essays_for_issue(issue)
    essays_for_issue(issue).where(published: true)
  end


  def self.published_essays_for_issue_and_award(issue_id, award)
    issue = IssueQuery.find(issue_id)
    issue.essays.where(published: true, award: award).order(:placement)
  end


  def self.relation
    Essay.all
  end

end

