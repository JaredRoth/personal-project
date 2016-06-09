require 'rails_helper'

RSpec.describe Vendor, type: :model do
  describe ".self.create_vendor_from" do
    scenario "it should create a vendor from auth info" do
      auth_info = OmniAuth::AuthHash.new
      auth_info[:info] = {email: "vendor@example.com"}

      Vendor.create_vendor_from(auth_info)
      expect(Vendor.all.count).to eq(1)
    end
  end

  describe ".self.o_auth_find_or_create_by" do
    scenario "it should find a vendor who already exists" do
      vendor = create(:vendor)

      auth_info = OmniAuth::AuthHash.new
      auth_info[:info] = {email: "vendor@example.com"}

      found_vendor = Vendor.o_auth_find_or_create_by(auth_info)
      expect(found_vendor.email).to eq(vendor.email)
    end

    scenario "it should create a vendor when one does not exist" do
      auth_info = OmniAuth::AuthHash.new
      auth_info[:info] = {email: "vendor@example.com"}

      Vendor.o_auth_find_or_create_by(auth_info)
      expect(Vendor.all.count).to eq(1)
    end
  end
end
