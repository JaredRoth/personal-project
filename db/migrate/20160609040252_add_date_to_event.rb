class AddDateToEvent < ActiveRecord::Migration
  def change
    add_column :events, :date, :date
    remove_column :events, :year, :integer
    add_column :events, :days, :integer
  end
end
