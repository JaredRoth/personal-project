class VendorsController < ApplicationController
  before_action :set_vendor

  def show
    session[:edit_vendor_redirect] = profile_path
  end

  def edit
  end

  def update
    if @vendor.update(vendor_params)
      path = session[:edit_vendor_redirect]
      session[:edit_vendor_redirect] = nil
      redirect_to path
    else
      flash.now[:notice] = @vendor.errors.full_messages.join(", ")
      render :edit, locals: {confirm: params[:confirm]}
    end
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
