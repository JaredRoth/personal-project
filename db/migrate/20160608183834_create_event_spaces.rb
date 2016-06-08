class CreateEventSpaces < ActiveRecord::Migration
  def change
    create_table :event_spaces do |t|
      t.decimal :number
      t.string :description
      t.boolean :electric, default: false
      t.references :vendor, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
