class LinkToRouteWithImage
  include RailsHelpers

  def self.call(route, title, image)
    self.new(route, title, image).link_to
  end


  def initialize(route, title, image)
    @route = route
    @title = title
    @image = image
  end


  def link_to
    "#{helpers.link_to(PlaceholderImage.call(211, 135, @image), @route)} #{helpers.link_to(@title, @route, class: "title")}"
  end
end
