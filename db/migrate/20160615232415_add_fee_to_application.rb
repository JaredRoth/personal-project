class AddFeeToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :fee, :integer, default: 7500
    add_column :applications, :card_token, :string
    add_column :applications, :email, :string
  end
end
