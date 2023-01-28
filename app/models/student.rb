class Student < ApplicationRecord
  ### Associations
  has_many :grades
  has_many :courses, through: :grades

  ### Validations
  validates :first_name, :family_name, :date_of_birth, presence: true
  validate :validate_age

  ### Instance Method
  def full_name
    "#{self.first_name} #{self.family_name}"
  end

  private

  def validate_age
    if date_of_birth.present? && date_of_birth > 10.years.ago.to_date
      errors.add(:date_of_birth, "The student must be over 10 years old.")
    end
  end
end