class VendorsController < ApplicationController
  before_action :set_vendor

  def show
  end

  def edit
  end

  def update
    @vendor.update(vendor_params)
    session[:new_vendor] = false
    path = session[:edit_vendor_redirect]
    session[:edit_vendor_redirect] = nil
    redirect_to path
  end

  private

  def set_vendor
    @vendor = current_user
  end

  def vendor_params
    params.require(:vendor).permit( :first_name,
                                    :last_name,
                                    :business_name,
                                    :product_description,
                                    :street_address,
                                    :city,
                                    :state,
                                    :zip)
  end
end
