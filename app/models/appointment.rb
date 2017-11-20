class Appointment < ApplicationRecord
  belongs_to :client
  # belongs_to :treatment
  validates :location, presence: true
  validates :client, presence: true
  # validates :treatment, presence: true
end
