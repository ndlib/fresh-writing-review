class IssueQuery

  def self.all
    relation.order(year: :desc)
  end

  def self.find(id)
    relation.friendly.find(id)
  end

  def self.relation
    Issue.all
  end

end
