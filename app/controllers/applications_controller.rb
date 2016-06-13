class ApplicationsController < ApplicationController
  def new
    @event = Event.find_by(title: params[:event])
    @application = @event.applications.new
  end

  def create
    @application = Application.new(application_params)
    if @application.save
      flash[:notice] = "Your application to #{params[:city]}'s #{params[:event]} has been received"
      redirect_to profile_path
    # else
    #   flash[:notice] = @application.errors.full_messages.join(", ")
    #   render :new
    end
  end

  private

  def application_params
    params.require(:application).permit(:spaces_amount, :chamber, :electric, :event_id, :vendor_id)
  end
end
