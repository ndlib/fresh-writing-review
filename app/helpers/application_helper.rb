module ApplicationHelper
  def display_notices
    content = raw("")
    if notice
      content += content_tag(:div, notice, class: "alert alert-info")
    end
    if alert
      content += content_tag(:div, alert, class: "alert")
    end
    if flash[:success].present?
      content += content_tag(:div, raw(flash[:success]), class: "alert alert-success")
    end
    if flash[:error].present?
      content += content_tag(:div, raw(flash[:error]), class: "alert alert-danger")
    end
    if flash[:warning].present?
      content += content_tag(:div, raw(flash[:warning]), class: "alert alert-warning")
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
