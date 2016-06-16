require "rails_helper"

RSpec.feature "Vendor applies to event", js: true do
  scenario "it should create a new application with their information" do
    vendor = create(:full_vendor)
    city = create(:city, name: "Carlsbad")
    event = create(:event, title: "Village Faire", city: city)
    ApplicationController.any_instance.stubs(:current_user).returns(vendor)

    visit "Carlsbad"

    within("##{event.id}") do
      click_on "Apply Online Now"
    end

    click_on "Begin Application"

    expect(current_path).to eq(edit_vendor_path)

    expect(page).to have_selector("input[value='#{vendor.business_name}']")
    expect(page).to have_selector("input[value='#{vendor.product_description}']")
    expect(page).to have_selector("input[value='#{vendor.street_address}']")
    expect(page).to have_selector("input[value='#{vendor.city}']")
    expect(page).to have_selector("input[value='#{vendor.state}']")
    expect(page).to have_selector("input[value='#{vendor.zip}']")

    click_on "Continue Application"

    expect(current_path).to eq("/Carlsbad/Village%20Faire/apply")

    fill_in :application_spaces_amount, with: 1
    # check :application_chamber
    check :application_electric

    click_button "Proceed to Payment"

    fill_in "card_number", with: 4242424242424242
    fill_in "cc-exp", with: Date.today.next_year
    fill_in "cc-csc", with: 123
    fill_in "billing-zip", with: 12345

    expect(current_path).to eq(profile_path)
    expect(page).to have_content("Your application to Carlsbad's Village Faire has been received")

    expect(Application.all.count).to eq(1)
    application = Application.first

    expect(application.spaces_amount).to eq(1)
    expect(application.chamber).to eq(false)
    expect(application.electric).to eq(true)
  end
end
