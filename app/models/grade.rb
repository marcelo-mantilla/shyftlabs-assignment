class Grade < ApplicationRecord
  ### Associations
  belongs_to :student
  belongs_to :course

  ### Validations
  validates :student_id, :course_id, :grade, presence: true
end