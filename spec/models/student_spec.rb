require 'rails_helper'

RSpec.describe Student, type: :model do
  context 'validations' do
    it 'should validate presence of attributes' do
      should validate_presence_of :first_name
      should validate_presence_of :family_name
      should validate_presence_of :date_of_birth
    end

    context 'age validation' do
      let(:student) { Student.new(first_name: 'Student', family_name: 'A', date_of_birth: '2022/01/01')}
      context 'student is > 10 years old' do
        before { student.date_of_birth = '2000/01/01' }
        it 'should save successfully' do
          expect(student.save).to eq true
        end
      end

      context 'student is < 10 years old' do
        before { student.date_of_birth = '2022/01/01' }
        it 'should raise an error' do
          expect(student.save).to eq false
        end
      end
    end
  end
end
