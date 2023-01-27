class Student < ApplicationRecord
  validates :first_name, :family_name, :date_of_birth, presence: true
  validate :validate_age

  private

  def validate_age
    if date_of_birth.present? && date_of_birth > 10.years.ago.to_date
      errors.add(:date_of_birth, "The student must be over 10 years old.")
    end
  end
end