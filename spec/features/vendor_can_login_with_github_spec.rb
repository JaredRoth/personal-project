require "rails_helper"

RSpec.feature "Vendor can login with Github" do
  scenario "it should create a new vendor" do
    visit github_login_path

    expect(current_path).to eq(root_path)
    expect(Vendor.all.count).to eq(1)
  end
end
