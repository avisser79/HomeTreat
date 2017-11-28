class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :specialist
  has_many :orders, dependent: :destroy
  has_many :treatments, through: :orders

  validates :location, presence: true
  validates :user, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :treatment_specialists_matching

  def treatment_specialists_matching
    errors.add(:treatments, "can't add treatments of different specialists") unless treatments.all? { |t| t.specialist == specialist }
  end
end
