class Vendor < ActiveRecord::Base
  has_many :applications
  has_many :vendors_categories
  has_many :categories, through: :vendors_categories

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update
  validates :business_name, presence: true, on: :update
  validates :product_description, presence: true, on: :update
  validates :street_address, presence: true, on: :update
  validates :city, presence: true, on: :update
  validates :state, presence: true, on: :update
  validates :zip, presence: true, on: :update
end
