class SessionsController < ApplicationController
  def create
    @vendor = Vendor.o_auth_find_or_create_by(request.env["omniauth.auth"])
    session[:vendor_id] = @vendor.id
    if @vendor.is_new
      redirect_to edit_vendor_path
    else
      flash[:notice] = "Successfully Logged In"
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Successfully Logged Out"
    redirect_to root_path
  end
end
