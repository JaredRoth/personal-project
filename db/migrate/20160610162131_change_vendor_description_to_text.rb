class ChangeVendorDescriptionToText < ActiveRecord::Migration
  def change
    change_column :vendors, :product_description, :text
  end
end
