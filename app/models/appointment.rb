class Appointment < ApplicationRecord
  belongs_to :client
  has_many :orders
  has_many :treatments, through: :orders

  validates :location, presence: true
  validates :client, presence: true
  validates :start_time, presence: true
end
