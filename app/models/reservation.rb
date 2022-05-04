class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :city, presence: true, length: { in: 1..50 }
  validates :date, presence: true, length: { in: 1..20 }
end