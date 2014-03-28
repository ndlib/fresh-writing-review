class LinkToRouteWithImage
  include RailsHelpers

  def self.call(route, title, image, width = 211, height = 135)
    self.new(route, title, image, width, height).link_to
  end


  def initialize(route, title, image, width = 211, height = 135)
    @route = route
    @title = title
    @image = image
    @width = width
    @height = height
  end


  def link_to
    "#{helpers.link_to(PlaceholderImage.call(@width, @height, @image), @route)} #{helpers.link_to(@title, @route, class: "title")}"
  end
end
