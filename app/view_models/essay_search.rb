class EssaySearch

  def self.build(controller)
    self.new
  end


  def results
    Essay.all.collect { | e | EssayLink.new(e) }
  end
end
