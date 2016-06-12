class EventsController < ApplicationController
  before_action :set_event
  def show
    session[:edit_vendor_redirect] = applications_path
  end

  private

  def set_event
    @event = Event.find_by(name: params[:event])
  end
end
