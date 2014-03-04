

class MarkDownConverter


  def self.call(text)
    self.new.convert
  end


  def initialize(text)
    @text = text
  end


  def convert
    @text
  end

end
