class PageQuery

  def self.all
    relation.order(:title)
  end

  def self.find(id)
    relation.friendly.find(id)
  end

  def self.submission_guidelines
    self.find('submission_guidelines')
  end

  def self.relation
    Page.all
  end

end
