class Vendor < ActiveRecord::Base
  has_many :vendors_categories
  has_many :categories, through: :vendors_categories

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :business_name, presence: true
  validates :product_description, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
end
