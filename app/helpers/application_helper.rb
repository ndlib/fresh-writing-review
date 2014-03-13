module ApplicationHelper
  def display_notices
    content = raw("")
    if notice
      content += content_tag(:div, notice, class: "alert alert-info")
    end
    if alert
      content += content_tag(:div, alert, class: "alert")
    end
    content_tag(:div, content, id: "notices")
  end

  def placeholder_image(width, height, id = nil)
    PlaceholderImage.call(width, height, id)
  end

  def header_class
    if request.path != '/'
      'sub'
    else
      'home'
    end
  end
end
