module ApplicationHelper
  
  def nav_li(text, url, active=false)
    content_tag :li, class: "nav-item #{'active' if active}" do
      link_to text, url, class: "nav-link #{"active" if active_path?(url)}"
    end
  end
  
  def active_path?(path)
    request.path == path
  end
  
  def bootstrap_class_for(flash_type)
    case flash_type
    when 'success'
      'alert-success'
    when 'error'
      'alert-error'
    when 'alert'
      'alert-warning'
    when 'notice'
      'alert-info'
    else
      flash_type.to_s
    end
  end
end
