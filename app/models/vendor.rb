class Vendor < ActiveRecord::Base
  has_many :vendors_categories
  has_many :categories, through: :vendors_categories
end
