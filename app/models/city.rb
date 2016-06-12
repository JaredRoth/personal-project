class City < ActiveRecord::Base
  has_many :events
  # Scope default order to name
end
