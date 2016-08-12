class SessionsController < ApplicationController
  def new

  end

  def create
    @vendor = Vendor.find_by(email: params[:session][:email])
    if @vendor && @vendor.authenticate(params[:session][:password])
      session[:vendor_id] = @vendor.id
      flash[:notice] = "Successfully Logged In"
      redirect_to session[:back]
    else
      flash.now[:error] = "Log in info does not match our records"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Successfully Logged Out"
    redirect_to :back
  end
end
