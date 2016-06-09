require 'rails_helper'

RSpec.describe Event, type: :model do
  describe ".self.this_year" do
    scenario "it should return all events this year that have not already happened sorted by date" do
      create(:event, date: Date.today.last_week,
                     name: "Old Event")
      create(:event, date: Date.tomorrow,
                     name: "First valid Event")
      create(:event, date: Date.today.end_of_year - 1,
                     name: "Last valid Event")
      create(:event, date: Date.today.next_week,
                     name: "Middle valid Event")
      create(:event, date: Date.today.end_of_year + 1,
                     name: "Future Event")

      expect(Event.this_year.count).to eq(3)
      expect(Event.this_year.first.name).to eq("First valid Event")
      expect(Event.this_year.last.name).to eq("Last valid Event")
    end
  end

  describe ".self.next_year" do
    scenario "it should return all events for the following year up to a year from today sorted by date" do
      create(:event, date: Date.today,
                     name: "Old Event")
      create(:event, date: Date.tomorrow.next_year,
                     name: "Future Event")
      create(:event, date: Date.yesterday.next_year,
                     name: "Last valid Event")
      create(:event, date: Date.today.end_of_year + 20,
                     name: "Middle valid Event")
      create(:event, date: Date.today.end_of_year + 1,
                     name: "First valid Event")

      expect(Event.next_year.count).to eq(3)
      expect(Event.next_year.first.name).to eq("First valid Event")
      expect(Event.next_year.last.name).to eq("Last valid Event")
    end
  end
end
