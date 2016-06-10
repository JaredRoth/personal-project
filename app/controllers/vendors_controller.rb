class VendorsController < ApplicationController

  def new
    @vendor = Vendor.new
  end

  def edit
  end

  private

  def vendor_params
    params.require(:vendor).permit(:email)
  end
end
