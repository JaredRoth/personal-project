require "rails_helper"

RSpec.describe ApplicationHelper do
  describe "present_event" do
    scenario "it should return a properly formatted single day event" do
      city = create(:city)
      event = create(:event, date: "May 7, 2017", days: 1, title: "Test", city: city)

      expect(present_event(event)).to eq("#{city.name} Test: May 7")
    end

    scenario "it should return a properly formatted multi-day event" do
      city = create(:city)
      event = create(:event, date: "April 29, 2017", days: 2, title: "Test", city: city)

      expect(present_event(event)).to eq("#{city.name} Test: April 29-30")
    end
  end
end
