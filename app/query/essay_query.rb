

class EssayQuery


  def self.find(id)
    relation.find(id)
  end


  def self.essay_for_issue_from_url(issue_id, id)
    relation.where(issue_id: issue_id).find(id)
  end

  def self.essays_for_issue(issue)
#    relation.where(issue_id: issue.id)
  end


  def self.relation
    Essay.all
  end

end
