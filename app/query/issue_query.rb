class IssueQuery

  def self.all
    relation.order(year: :desc)
  end

  def self.year(year)
    relation.where(year: year).first!
  end

  def self.find(id)
    relation.find(id)
  end

  def self.relation
    Issue.all
  end

end
