class PageQuery

  def self.all
    relation
  end

  def self.find(id)
    relation.friendly.find(id)
  end

  def self.relation
    Page.all
  end

end
