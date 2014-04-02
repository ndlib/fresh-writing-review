class IssuePublisher
  def self.publish(issue)
    self.new(issue).publish
  end

  def self.unpublish(issue)
    self.new(issue).unpublish
  end

  attr_reader :issue

  def initialize(issue)
    @issue = issue
  end

  def publish
    set_published(true)
  end

  def unpublish
    set_published(false)
  end

  def set_published(value)
    issue.published = value
    issue.save
    reindex_essays
  end

  def reindex_essays
    issue.essays.each do |essay|
      essay.save
    end
  end

end
