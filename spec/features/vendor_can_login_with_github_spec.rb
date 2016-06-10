require "rails_helper"

RSpec.feature "Vendor logs in with Github" do
  scenario "it should create a new vendor if they don't exist and redirect them to the update page" do
    expect(Vendor.all.count).to eq(0)
    visit root_path

    click_on("Login")

    expect(current_path).to eq(edit_vendor_path)
    expect(page).not_to have_content("Successfully Logged In")
    expect(page).not_to have_css(".navbar-fixed")
    expect(Vendor.all.count).to eq(1)

    fill_in :first_name, with: "FName"
    fill_in :last_name, with: "LName"
    fill_in :business_name, with: "BName"
    fill_in :product_description,
      with: "We sell handcrafted jewelry."
    fill_in :street_address, with: "1234 Main Street"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: "12345"

    click_on "Submit"

    expect(Vendor.all.count).to eq(1)
    expect(current_path).to eq(vendor_path)
    expect(page).to have_content("FName")
    expect(page).to have_content("LName")
    expect(page).to have_content("BName")
    expect(page).to have_content("We sell handcrafted jewelry.")
    expect(page).to have_content("1234 Main Street")
    expect(page).to have_content("Denver")
    expect(page).to have_content("CO")
    expect(page).to have_content("12345")
  end

  scenario "it should log a vendor in if they do exist" do
    expect(Vendor.all.count).to eq(0)
    vendor = create(:full_vendor)
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
