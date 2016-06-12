class ApplicationsController < ApplicationController
  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    if @application.save
      flash[:notice] = "Your application to #{params[:event]} has been received"
      redirect_to profile_path
    else
      flash[:notice] = @application.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def application_params
    params.require(:application).permit(:spaces_amount, :chamber, :electric)
  end
end
