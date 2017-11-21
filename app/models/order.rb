class Order < ApplicationRecord
  belongs_to :appointment
  belongs_to :treatment

  validates :appointment, presence: true
  validates :treatment, presence: true
end
