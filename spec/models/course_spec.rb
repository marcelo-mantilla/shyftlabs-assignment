require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'validations' do
    it 'should validate presence of attributes' do
      should validate_presence_of :name
    end
  end
end
