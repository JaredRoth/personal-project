class EventsController < ApplicationController
  before_action :set_event
  def show

  end

  private

  def set_event
    @event = Event.find_by(name: params[:event])
  end
end
