class EssayStyleQuery

  def self.all
    relation
  end

  def self.find(id)
    relation.friendly.find(id)
  end

  def self.relation
    EssayStyle.all
  end

end
