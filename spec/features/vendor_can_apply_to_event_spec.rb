require "rails_helper"

RSpec.feature "Vendor applies to event" do
  scenario "it should create a new application with their information", js: true do
    vendor = create(:full_vendor)
    city = create(:city, name: "Carlsbad")
    event = create(:event, title: "Village Faire", city: city)
    ApplicationController.any_instance.stubs(:current_user).returns(vendor)

    visit "Carlsbad"

    within("##{event.title.parameterize}") do
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
    # find("#application_electric").trigger("click")
    page.execute_script('$("#application_electric").trigger("click")')
    # check :application_electric

    click_on "Proceed to Payment"

    sleep(3)
    stripe_iframe = all('iframe[name=stripe_checkout_app]').last
    Capybara.within_frame stripe_iframe do
      page.execute_script(%Q{ $('input#card_number').val('4242424242424242'); })
      page.execute_script(%Q{ $('input#cc-exp').val('08/44'); })
      page.execute_script(%Q{ $('input#cc-csc').val('999'); })
      page.execute_script(%Q{ $('#submitButton').click(); })
      sleep(7)
    end

    expect(page).to have_content("Your application to Carlsbad's Village Faire has been received")
    expect(current_path).to eq(profile_path)

    expect(Application.all.count).to eq(1)
    application = Application.first

    expect(application.spaces_amount).to eq(1)
    expect(application.chamber).to eq(false)
    expect(application.electric).to eq(true)
  end
end
