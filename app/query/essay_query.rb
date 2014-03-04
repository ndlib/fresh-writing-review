

class EssayQuery


  def self.find(id)
    relation.find(id)
  end


  def self.essays_for_issue(issue)
#    relation.where(issue_id: issue.id)
  end


  def self.relation
    Essay.all
  end

end
