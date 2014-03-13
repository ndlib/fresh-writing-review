class PlaceholderImage
  include RailsHelpers

  def self.call(width, height, id = nil)
    self.new(width, height, id).image
  end


  def initialize(width, height, id = nil)
    @width = width
    @height = height
    @id = id
  end


  def image
    if (@id)
      colors = %w(A92B48 A4A774 EE964D 003167 FDC43D)
      color = colors[@id%colors.length]
      helpers.image_tag("http://placehold.it/#{@width}x#{@height}/#{color}/fff")
    else
      helpers.image_tag("http://placehold.it/#{@width}x#{@height}")
    end
  end

end
