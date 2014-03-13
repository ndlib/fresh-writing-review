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
    if (id)
      colors = %w(A92B48 A4A774 EE964D 003167 FDC43D)
      color = colors[id%colors.length]
      image_tag("http://placehold.it/#{width}x#{height}/#{color}/fff")
    else
      image_tag("http://placehold.it/#{width}x#{height}")
    end
  end


  def header_class
    if request.path != '/'
      'sub'
    else
      'home'
    end
  end
end
