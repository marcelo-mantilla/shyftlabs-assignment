class Course < ApplicationRecord
  ### Associations
  has_many :grades
  has_many :students, through: :grades

  ### Validations
  validates :name, presence: true, uniqueness: true

  ### Instance Methods
end
