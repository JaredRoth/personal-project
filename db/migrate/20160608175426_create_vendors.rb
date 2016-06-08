class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :first_name
      t.string :last_name
      t.string :business_name
      t.string :product_description
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end
