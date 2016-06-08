class VendorsCategory < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :category
end
