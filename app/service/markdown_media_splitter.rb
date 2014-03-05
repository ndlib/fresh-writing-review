

class MarkdownMediaSplitter

  SPLIT_TAG = '<!!media-bar!!>'


  def initialize(txt)
    @txt = txt
    @top_text = ""
    @bottom_text = ""
  end


  def top_text
    split!
    @top_text
  end


  def bottom_text
    split!
    @bottom_text
  end

  private

    def split!
      sp = @txt.split(SPLIT_TAG)
      if sp.size == 1
        @bottom_text = sp.first
      else
        @top_text = sp.shift
        @bottom_text = sp.join("")
      end
    end
end


