class Student < ApplicationRecord
  ### Associations
  has_many :results
  has_many :courses, through: :results

  ### Validations
  validates :first_name, :family_name, :date_of_birth, presence: true
  validates :first_name, :family_name, length: { maximum: 25 }

  validate :validate_age

  ### Instance Method
  def full_name
    "#{self.first_name} #{self.family_name}"
  end

  private

  def validate_age
    if date_of_birth.present? && date_of_birth > 10.years.ago.to_date
      return errors.add(:date_of_birth, "is invalid, must be over 10 years of age")
    end

    if date_of_birth.present? && date_of_birth < 100.years.ago.to_date
      return errors.add(:date_of_birth, "is invalid, must be under 100 years of age")
    end
  end
end