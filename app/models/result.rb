class Result < ApplicationRecord
  ### Associations
  belongs_to :student
  belongs_to :course

  ### Enums
  # enum grade: %w[A B C D E F]

  ### Validations
  validates :student, :course, :grade, presence: true
  validates :grade, inclusion: { in: %w[A B C D E F] }
end