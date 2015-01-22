class MarkDownConverter

  IMAGE_SPLIT_TEXT = '$$##!!@@##$$%%$$'

  include RailsHelpers

  def self.call(text)
    self.new(text).convert
  end

  attr_reader :text

  def initialize(text)
    @text = text.to_s
  end


  def convert
    converted_text = preprocess_images(text)
    converted_text = renderer.render(converted_text)
    converted_text = parse_image_tags(converted_text)
    converted_text = add_ul_and_li(converted_text)

    helpers.raw converted_text
  end


  def renderer
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(:hard_wrap => true), :autolink => true, :space_after_headers => true)
  end



  def parse_image_tags(text)
    # first replace all the images with the figure html and add a marker so I can identify
    # each of the images later.
    frag = Nokogiri::HTML.fragment(text)
    frag.css('img').each { |img|
      full_link = img["src"].gsub("/small/","/original/")
      inner_contents = "<a href=\"#{full_link}\" data-lightbox=\"essay\" data-title=\"#{img['title']}\">#{img.to_html}</a>"
      if img['title']
        inner_contents += "<figcaption>#{img['title']}</figcaption>"
      end
      before_text = "#{IMAGE_SPLIT_TEXT}<figure>"
      after_text = "</figure>#{IMAGE_SPLIT_TEXT}"
      img.replace(before_text + inner_contents + after_text)
     }

     frag.to_html
  end


  def add_ul_and_li(text)
    # now go through and split the images back out so we can encase them in a ul
    results = []
    text.split(IMAGE_SPLIT_TEXT).each do | section |
      if section.nil? || section == ""
        next
      end
      if section.match(/^<figure/)
        if results.last.is_a?(String)
          results << []
        end
        results.last << section
      else
        if section != " "
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

  def preprocess_images(text)
    processed = preprocess_images_combine_into_single_line(text)
    processed = preprocess_image_newlines(processed)
    processed
  end

  def preprocess_images_combine_into_single_line(text)
    # combine multiple lines of markdown images into one line
    expression = /\s*([!](\[[^\]]*\])+)\s*(?=[!]\[)/
    text.gsub(expression, '\1 ')
  end

  def preprocess_image_newlines(text)
    # insert newlines before and after images to ensure surrounding text is in <p> tags
    expression = /\s*((\s*[!](\[[^\]]*\])+)+)\n*\s*/
    text.gsub(expression,"\n\n" + '\1' + "\n\n")
  end
end

