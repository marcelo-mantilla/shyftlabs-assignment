require 'rails_helper'

RSpec.describe Student, type: :model do
  context 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :family_name }
    it { should validate_presence_of :date_of_birth }

    context 'name is too long' do
      let(:student) {
        Student.new(first_name:    'Abnormally long name that is unrealistic and nobody would actually have',
                    family_name:   'A',
                    date_of_birth: Date.new - 1.year) }
      it 'should raise an error' do
        expect(student.valid?).to eq false
        expect(student.errors.full_messages.first).to eq 'First name is too long (maximum is 25 characters)'
      end
    end

    context 'age validation' do
      let(:student) { Student.new(first_name: 'Student', family_name: 'A', date_of_birth: Date.new - 1.year) }

      context 'student is > 10 years old' do
        let(:age) { (DateTime.now - 20.years).strftime("%Y/%m/%d") }
        before { student.date_of_birth = age }
        it 'should save successfully' do
          expect(student.save).to eq true
        end
      end

      context 'student is > 100 years old' do
        let(:age) { (DateTime.now - 101.years).strftime("%Y/%m/%d") }
        before { student.date_of_birth = age }
        it 'should raise an error' do
          expect(student.valid?).to eq false
          expect(student.errors.full_messages.first).to eq 'Date of birth is invalid, must be under 100 years of age'
        end
      end

      context 'student is < 10 years old' do
        let(:age) { (DateTime.now - 2.years).strftime("%Y/%m/%d") }
        before { student.date_of_birth = age }
        it 'should raise an error' do
          expect(student.valid?).to eq false
          expect(student.errors.full_messages.first).to eq 'Date of birth is invalid, must be over 10 years of age'
        end
      end
    end
  end
end
