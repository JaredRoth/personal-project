class AddCityToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :city, index: true, foreign_key: true
  end
end
