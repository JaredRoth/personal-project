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

    fill_in :vendor_first_name, with: "FName"
    fill_in :vendor_last_name, with: "LName"
    fill_in :vendor_business_name, with: "BName"
    fill_in :vendor_product_description,
      with: "We sell handcrafted jewelry."
    fill_in :vendor_street_address, with: "1234 Main Street"
    fill_in :vendor_city, with: "Denver"
    fill_in :vendor_state, with: "CO"
    fill_in :vendor_zip, with: "12345"

    click_on "Submit Updated Information"

    expect(Vendor.all.count).to eq(1)
    vendor = Vendor.first

    expect(vendor.first_name).to eq("FName")
    expect(vendor.last_name).to eq("LName")
    expect(vendor.business_name).to eq("BName")
    expect(vendor.product_description).to eq("We sell handcrafted jewelry.")
    expect(vendor.street_address).to eq("1234 Main Street")
    expect(vendor.city).to eq("Denver")
    expect(vendor.state).to eq("CO")
    expect(vendor.zip).to eq(12345)

    expect(current_path).to eq(profile_path)
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
