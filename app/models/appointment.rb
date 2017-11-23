class Appointment < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :treatments, through: :orders

  validates :location, presence: true
  validates :user, presence: true
  validates :start_time, presence: true

  def specialist
    treatments.first.specialist
  end
end
