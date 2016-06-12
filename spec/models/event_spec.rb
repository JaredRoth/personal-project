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
      expect(Event.this_year.first.title).to eq("First valid Event")
      expect(Event.this_year.last.title).to eq("Last valid Event")
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
      expect(Event.next_year.first.title).to eq("First valid Event")
      expect(Event.next_year.last.title).to eq("Last valid Event")
    end
  end
end
