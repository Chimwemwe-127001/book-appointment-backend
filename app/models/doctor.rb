# frozen_string_literal: true

class Doctor < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  validates :name, presence: true, length: { in: 1..50 }
  validates :details, presence: true, length: { in: 1..500 }
  validates :photo, presence: true, length: { in: 1..200 }
  validates :city, presence: true, length: { in: 1..50 }
  validates :specialization, presence: true, length: { in: 1..50 }
  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
