class EssayPublisher
  def self.publish(essay)
    self.new(essay).publish
  end

  def self.unpublish(essay)
    self.new(essay).unpublish
  end

  attr_reader :essay

  def initialize(essay)
    @essay = essay
  end

  def publish
    set_published(true)
  end

  def unpublish
    set_published(false)
  end

  def set_published(value)
    essay.published = value
    essay.save!
  end

end
