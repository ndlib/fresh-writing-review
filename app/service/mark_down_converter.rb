class MarkDownConverter

  SPLIT_TEXT = '$$##!!@@##$$%%$$'

  include RailsHelpers

  def self.call(text)
    self.new(text).convert
  end


  def initialize(text)
    @text = text.to_s
  end


  def convert
    converted_text = renderer.render(@text)
    converted_text = parse_image_tags(converted_text)

    helpers.raw renderer.render(converted_text)
  end


  def renderer
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(:hard_wrap => true), :autolink => true, :space_after_headers => true)
  end


  def parse_image_tags(text)
    frag = Nokogiri::HTML(text)
    frag.xpath("//img").each { |img|
      before_text = "#{SPLIT_TEXT}<figure>"
      after_text = '<figcaption>Figure 1</figcaption></figure></li>'
      img.replace(before_text + img.to_html + after_text)
     }

     frag.to_html
  end


  def add_ul_and_li(text)
    results = {}
    text.split('$$##!!@@##$$%%$$').each do | section |
      if section.match(/^<figure/)

      else

      end
    end
  end

end
