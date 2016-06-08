class Vendor < ActiveRecord::Base
  has_many :vendors_categories
  has_many :categories, through: :vendors_categories

  validates :email, presence: true, uniqueness: true

  def self.o_auth_find_or_create_by(auth_info)
    vendor = find_by(email: auth_info.info.email)
    vendor = create_vendor_from(auth_info) if vendor.nil?
    vendor
  end

  def self.create_vendor_from(auth_info)
    create(email: auth_info.info.email)
  end
end
