class EssayAwardQuery
  def self.find(id)
    relation.find(id)
  end

  def self.published_essay_awards_for_issue_and_award(issue_id, award)
    issue = IssueQuery.find(issue_id)
    award.essay_awards.includes(:essay).where("essays.published = ? AND essays.issue_id = ?", true, issue.id).order("essay_awards.placement").references(:essays)
  end


  def self.relation
    EssayAward.all
  end

end
