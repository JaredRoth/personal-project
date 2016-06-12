module ApplicationHelper
  def link_to_login_or_logout
    if current_user
      render partial: "partials/dropdown"
    else
      link_to "Login", github_login_path
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
end
