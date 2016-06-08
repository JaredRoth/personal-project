class Event < ActiveRecord::Base
  validates :name, presence: true
  validates :year, presence: true, uniqueness: true
  validates :season, presence: true
end
