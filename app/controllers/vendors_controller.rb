class VendorsController < ApplicationController

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      flash[:notice] = "Account successfully created"
      session[:vendor_id] = @vendor.id
    else
      flash[:notice] = @vendor.errors.full_messages.join(", ")
    end
    redirect_to root_path
  end

  private

  def vendor_params
    params.require(:vendor).permit(:email)
  end
end
