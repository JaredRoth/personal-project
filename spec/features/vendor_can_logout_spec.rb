require "rails_helper"

RSpec.feature "Vendor can logout" do
  scenario "They see the login link" do
    visit github_login_path

    click_on("Logout")

    expect(page).to have_content("Login")
    expect(page).not_to have_content("Logout")
    expect(page).to have_content("Successfully Logged Out")
  end
end
