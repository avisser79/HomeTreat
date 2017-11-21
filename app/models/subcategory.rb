class Subcategory < ApplicationRecord
  belongs_to :category
  # has_many :treatments
  # has_many :specialists, through: :treatments
  validates :category, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :category }
end
