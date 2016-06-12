require 'rails_helper'

RSpec.describe Event, type: :model do
  describe ".self.this_year" do
    scenario "it should return all events this year that have not already happened sorted by date" do
      create(:event, date: Date.today.last_week,
                     title: "Old Event")
      create(:event, date: Date.tomorrow,
                     title: "First valid Event")
      create(:event, date: Date.today.end_of_year - 1,
                     title: "Last valid Event")
      create(:event, date: Date.today.next_week,
                     title: "Middle valid Event")
      create(:event, date: Date.today.end_of_year + 1,
                     title: "Future Event")

      expect(Event.this_year.count).to eq(3)
      expect(Event.this_year.first).to include("First valid Event")
      expect(Event.this_year.last).to include("Last valid Event")
    end
  end

  describe ".self.next_year" do
    scenario "it should return all events for the following year up to a year from today sorted by date" do
      create(:event, date: Date.today,
                     title: "Old Event")
      create(:event, date: Date.tomorrow.next_year,
                     title: "Future Event")
      create(:event, date: Date.yesterday.next_year,
                     title: "Last valid Event")
      create(:event, date: Date.today.end_of_year + 20,
                     title: "Middle valid Event")
      create(:event, date: Date.today.end_of_year + 1,
                     title: "First valid Event")

      expect(Event.next_year.count).to eq(3)
      expect(Event.next_year.first).to include("First valid Event")
      expect(Event.next_year.last).to include("Last valid Event")
    end
  end

  describe ".self.present_events" do
    scenario "it should return an array of properly formatted single and multi-day events" do
      city = create(:city)
      create(:event, date: "May 7, 2017", days: 1, title: "Test", city: city)
      create(:event, date: "April 29, 2017", days: 2, title: "Test", city: city)

      events = Event.present_events(Event.all)
      expect(events.first).to eq("#{city.name} Test: May 7")
      expect(events.last).to eq("#{city.name} Test: April 29-30")
    end
  end
end
