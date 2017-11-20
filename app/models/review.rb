class Review < ApplicationRecord
  belongs_to :user
  belongs_to :specialist
  has_many   :appointments

  validates :title, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: [0, 1, 2, 3, 4, 5] }
  validates :client, presence: true
  validates :specialist, presence: true
end
