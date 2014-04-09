class EssayFormat

  attr_accessor :essay

  def initialize(essay)
    @essay = essay
  end


  def media?
    @essay.embed.present?
  end


  def text?
    @essay.embed.nil? || @essay.embed.content.empty?
  end

end
