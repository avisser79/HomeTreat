class Specialist < ApplicationRecord
  belongs_to :user
  has_many :treatments
  has_many :subcategories, through: :treatments

  validates :bio, presence: true
  validates :user, presence: true
end

