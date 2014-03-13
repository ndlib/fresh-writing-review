class LinkToRouteWithImage
  include RailsHelpers

  def self.call(route, title, id, image = "")
    self.new(route, title, id, image).link_to
  end


  def initialize(route, title, id, image = "")
    @route = route
    @title = title
    @id = id
    @image = image
  end


  def link_to
    "
      #{helpers.link_to(PlaceholderImage.call(211, 135, @id), @route)}
      #{helpers.link_to(@title, @route, class: "title")}
    "
  end
end
