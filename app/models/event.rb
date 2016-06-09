class Event < ActiveRecord::Base
  validates :name, presence: true
  validates :season, presence: true
  validates :date, presence: true
  # validates :name, uniqueness: {scope: :date}

  def self.this_year
    start = Date.yesterday
    finish = Date.new(start.year + 1, 1, 1)
    where(date: start..finish)
  end

  def self.next_year
    date = Date.today
    start = Date.new(date.year + 1, 1, 1)
    finish = date.next_year
    where(date: start..finish)
  end
end
