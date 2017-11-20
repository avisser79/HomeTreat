class Subcategory < ApplicationRecord
  # belongs_to :category
  # has_many :treatments
  # has_many :specialists, through: :treatments
  validates :name, presence: true, uniqueness: true
end
