module ApplicationHelper
  def link_to_login_or_logout
    if current_user
      link_to "Logout", logout_path, method: :delete
    else
      link_to "Login", github_login_path
    end
  end
end
