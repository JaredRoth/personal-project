class Application < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :event

  validates :spaces_amount, presence: true

  scope :received, -> { where(status: 0) }
  scope :rejected, -> { where(status: 1) }
  scope :approved, -> { where(status: 2) }

  enum status: %w(received rejected approved)

end
