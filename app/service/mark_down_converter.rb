class MarkDownConverter

  SPLIT_TEXT = '$$##!!@@##$$%%$$'
#  SPLIT_TEXT = ''
  include RailsHelpers

  def self.call(text)
    self.new(text).convert
  end


  def initialize(text)
    @text = text.to_s
  end


  def convert
    converted_text = renderer.render(@text)
#    converted_text = parse_image_tags(converted_text)
#    converted_text = add_ul_and_li(converted_text)

    helpers.raw renderer.render(converted_text)
  end


  def renderer
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(:hard_wrap => true), :autolink => true, :space_after_headers => true)
  end



  def parse_image_tags(text)
    # first replace all the images with the figure html and add a marker so I can identify
    # each of the images later.
    frag = Nokogiri::HTML.fragment(text)
    frag.css('img').each { |img|
      before_text = "#{SPLIT_TEXT}<figure>"
      if img['title']
        after_text = "<figcaption>#{img['title']}</figcaption></figure>#{SPLIT_TEXT}"
      else
        after_text = "</figure>#{SPLIT_TEXT}"
      end
      img.replace(before_text + img.to_html + after_text)
     }

     frag.to_html
  end


  def add_ul_and_li(text)
    # now go through and split the images back out so we can encase them in a ul
    results = []
    text.split('$$##!!@@##$$%%$$').each do | section |
      if section.nil? || section == ""
        next
      end
      if section.match(/^<figure/)
        if results.last.is_a?(String)
          results << []
        end
        results.last << section
      else
        if section != "<br>"
          results << section
        end
      end
    end

    # rebuild the output.
    output = ''
    results.each do | r |
      if r.is_a?(String)
        output += r
      else
        output += "<ul class=\"small-block-grid-2\"><li>#{r.join("</li><li>")}</ul>"
      end
    end

    output
  end

end

