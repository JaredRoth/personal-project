require "rails_helper"

RSpec.feature "Vendor can login with Github" do
  scenario "it should create a new vendor" do
    visit root_path

    click_on("Login")

    expect(current_path).to eq(root_path)
    expect(Vendor.all.count).to eq(1)
  end
end
