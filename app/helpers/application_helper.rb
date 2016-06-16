module ApplicationHelper
  def link_to_login_or_logout
    if current_user
      render partial: "partials/dropdown"
    else
      session[:back] = request.original_url
      link_to "Login", github_login_path
    end
  end

  def link_to_login_or_apply(city, event)
    if current_user
      already_applied_link(city, event)
    else
      link_to "Log in to apply", github_login_path, class: "btn"
    end
  end

  def already_applied_link(city, event)
    if current_user.applications.find_by(event_id: event.id).nil?
      link_to "Apply Online Now", event_path(city.name, event.title), class: "btn"
    else
      link_to "Submitted", event_path(city.name, event.title), class: "btn disabled"
    end
  end

  def present_event(event)
    if event.days == 1
      "#{event.city.name} #{event.title}: #{event.date.strftime('%B%e')}"
    else
      finish = event.date + event.days - 1
      "#{event.city.name} #{event.title}: #{event.date.strftime('%B %e')}-#{finish.strftime('%e')}"
    end
  end

  def present_day(event)
    if event.days == 1
      "#{event.date.strftime('%B%e, %Y')}"
    else
      finish = event.date + event.days - 1
      "#{event.date.strftime('%B %e')}-#{finish.strftime('%e, %Y')}"
    end
  end
end
