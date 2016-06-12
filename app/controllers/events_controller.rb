class EventsController < ApplicationController
  before_action :set_city

  def index
    @events = @city.events
  end

  def show
    @event = Event.find_by(title: params[:event])
    session[:edit_vendor_redirect] = applications_path
  end

  private

  def set_city
    @city = City.find_by(name: params[:city])
  end
end
