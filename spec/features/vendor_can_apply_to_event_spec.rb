require "rails_helper"

RSpec.feature "Vendor applies to event" do
  scenario "it should create a new application with their information" do
    vendor = create(:full_vendor)
    ApplicationController.any_instance.stubs(:current_user).returns(vendor)

    visit "Carlsbad"

    click_on "Apply Online for the Next Show!"

    expect(current_path).to eq(edit_vendor_path)

    expect(page).to have_content(vendor.business_name)
    expect(page).to have_content(vendor.product_description)
    expect(page).to have_content(vendor.street_address)
    expect(page).to have_content(vendor.city)
    expect(page).to have_content(vendor.state)
    expect(page).to have_content(vendor.zip)

    click_on "Continue Application"

    expect(current_path).to eq("Carlsbad/apply")

    fill_in :application_space_amount, with: 1
    fill_in :application_chamber, with: false
    fill_in :application_electric, with: true

    click_on "Submit Application"

    expect(current_path).to eq(profile_path)
    expect(page).to have_content("Your application to Carlsbad has been received")
  end
end
