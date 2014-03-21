class EssayAwardQuery


  def self.all
    relation.order(:title)
  end


  def self.find(id)
    relation.friendly.find(id)
  end


  def self.relation
    EssayAward.all
  end
end
