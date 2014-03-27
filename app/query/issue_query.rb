class IssueQuery

  def self.all
    relation.order(year: :desc)
  end


  def self.published
    relation.where(published: true).order(year: :desc)
  end


  def self.current
    relation.order(year: :desc).where(published: true).first!
  end

  def self.current?
    relation.count > 0
  end

  def self.find(id)
    relation.friendly.find(id)
  end

  def self.relation
    Issue.all
  end

end
