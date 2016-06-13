class Event < ActiveRecord::Base
  belongs_to :city
  has_many :applications

  validates :title, presence: true
  validates :season, presence: true
  validates :date, presence: true
  # validates :name, uniqueness: {scope: :date}

  def self.this_year
    start = Date.yesterday
    finish = start.end_of_year
    where(date: start..finish).order(:date)
  end

  def self.next_year
    date = Date.today
    start = date.end_of_year + 1
    finish = date.next_year
    where(date: start..finish).order(:date)
  end
end
