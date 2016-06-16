class SessionsController < ApplicationController
  def create
    @vendor = Vendor.o_auth_find_or_create_by(request.env["omniauth.auth"])
    session[:vendor_id] = @vendor.id
    if @vendor.is_new
      session[:new_vendor] = true
      session[:edit_vendor_redirect] = profile_path
      redirect_to edit_vendor_path(confirm: "Finalize Registration")
    else
      flash[:notice] = "Successfully Logged In"
      redirect_to session[:back]
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Successfully Logged Out"
    redirect_to :back
  end
end
