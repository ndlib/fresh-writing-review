class EssayStyleQuery

  def self.all
    relation
  end

  def self.slug(slug)
    relation.where(slug: slug).first!
  end

  def self.find(id)
    relation.find(id)
  end

  def self.relation
    EssayStyle.all
  end

end
