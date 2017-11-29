class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :specialist
  has_many :orders, dependent: :destroy
  has_many :treatments, through: :orders

  validates :location, presence: true
  validates :user, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :date, presence: true
  validates :treatments, presence: true
  validate :treatment_specialists_matching
  validate :appointment_in_availability

  def treatment_specialists_matching
    errors.add(:treatments, "can't add treatments of different specialists") unless treatments.all? { |t| t.specialist == specialist }
  end

  def appointment_in_availability
    availabilities = specialist.availabilities.where(date: date)
    errors.add(:start_time, "Specialist is not available at this time") unless availabilities.any? { |a| start_time.between?(a.start_time, a.end_time) && end_time.between?(a.start_time, a.end_time) }
    byebug
  end
end
