require "rails_helper"

RSpec.feature "Vendor logs in with Github" do
  scenario "it should create a new vendor if they don't exist and log them in" do
    expect(Vendor.all.count).to eq(0)
    visit root_path

    click_on("Login")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Successfully Logged In")
    expect(page).to have_content("Logout")
    expect(page).not_to have_content("Login")
    expect(Vendor.all.count).to eq(1)
  end

  scenario "it should log a vendor in if they do exist" do
    expect(Vendor.all.count).to eq(0)
    vendor = create(:vendor)
    expect(Vendor.all.count).to eq(1)

    visit root_path

    click_on("Login")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Successfully Logged In")
    expect(page).to have_content("Logout")
    expect(page).not_to have_content("Login")
    expect(Vendor.all.count).to eq(1)
  end
end
