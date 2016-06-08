class CreateVendorsCategories < ActiveRecord::Migration
  def change
    create_table :vendors_categories do |t|
      t.references :vendor, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
    end
  end
end
