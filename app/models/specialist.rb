class Specialist < ApplicationRecord
  belongs_to :user
  has_many :treatments
  has_many :subcategories, through: :treatments
  has_many :appointments
  has_many :availabilities

  validates :bio, presence: true
  validates :user, presence: true

  def full_name
    user.first_name + ' ' + user.last_name
  end
end

