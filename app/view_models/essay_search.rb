class EssaySearch

  def self.build(controller)
    self.new
  end

  def initialize()

  end


  def results
    Essay.all
  end
end
