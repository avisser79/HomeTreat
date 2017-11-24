class Order < ApplicationRecord
  belongs_to :appointment
  belongs_to :treatment

  validates :appointment, presence: true
  validates :treatment, presence: true
  # validates_uniqueness_of :treatment[:specialist_id], scope: :appointment_id
end
