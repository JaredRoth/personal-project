require "rails_helper"

RSpec.feature "Vendor can logout" do
  scenario "When they are logged in" do
    vendor = create(:full_vendor)

    visit root_path
    click_on("Login")
    click_on("Logout")

    expect(page).to have_content("Login")
    expect(page).not_to have_content("Logout")
    expect(page).to have_content("Successfully Logged Out")
  end
end
