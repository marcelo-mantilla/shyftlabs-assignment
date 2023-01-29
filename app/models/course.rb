class Course < ApplicationRecord
  ### Associations
  has_many :results
  has_many :students, through: :results

  ### Validations
  validates :name, presence: true, uniqueness: true
end
