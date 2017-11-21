class Treatment < ApplicationRecord
  belongs_to :specialist
  belongs_to :subcategory
  has_many :orders

  validates :description, presence: true, uniqueness: { case_sensitive: false, scope: :specialist, message: "You already have this treatment" }
  validates :price, presence: true, numericality: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 5 }
  validates :specialist, presence: true
  validates :subcategory, presence: true
end
