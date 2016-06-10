class WelcomeController < ApplicationController
  def index
    @this_year = Event.this_year
    @next_year = Event.next_year
  end
end
