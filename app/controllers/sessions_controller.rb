class SessionsController < ApplicationController
  def create
    if @vendor = Vendor.o_auth_find_or_create_by(request.env["omniauth.auth"])
      session[:vendor_id] = @vendor.id
      flash[:notice] = "Successfully Logged In"
    end
    redirect_to root_path
  end

  def destroy
    session.clear
    flash[:notice] = "Successfully Logged Out"
    redirect_to root_path
  end
end
