class EditorQuery

  def self.all
    relation
  end

  def self.find(id)
    relation.find(id)
  end

  def self.relation
    Editor.all
  end

end
