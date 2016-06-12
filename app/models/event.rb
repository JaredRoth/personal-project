class Event < ActiveRecord::Base
  belongs_to :city

  validates :title, presence: true
  validates :season, presence: true
  validates :date, presence: true
  # validates :name, uniqueness: {scope: :date}

  def self.this_year
    start = Date.yesterday
    finish = start.end_of_year
    events = where(date: start..finish).order(:date)
    present_events(events)
  end

  def self.next_year
    date = Date.today
    start = date.end_of_year + 1
    finish = date.next_year
    events = where(date: start..finish).order(:date)
    present_events(events)
  end

  def self.present_events(events)
    events.map do |event|
      if event.days == 1
        "#{event.city.name} #{event.title}: #{event.date.strftime('%B%e')}"
      else
        finish = event.date + event.days - 1
        "#{event.city.name} #{event.title}: #{event.date.strftime('%B %e')}-#{finish.strftime('%e')}"
      end
    end
  end
end
