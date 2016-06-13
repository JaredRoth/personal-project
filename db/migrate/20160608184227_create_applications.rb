class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :status, default: 0
      t.integer :spaces_amount, default: 1
      t.boolean :chamber
      t.boolean :electric
      t.references :vendor, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
