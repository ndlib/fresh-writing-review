class IssueQuery

  def self.all
    relation.order(year: :desc)
  end

  def self.relation
    Issue
  end

end
