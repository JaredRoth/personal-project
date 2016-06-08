class EventSpace < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :event

  validates :number, presence: true, uniqueness: true
  validates :description, presence: true
end
