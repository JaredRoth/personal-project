class Category < ActiveRecord::Base
  has_many :vendors_categories
  has_many :vendors, through: :vendors_categories

  validates :name, presence: true, uniqueness: true
end
