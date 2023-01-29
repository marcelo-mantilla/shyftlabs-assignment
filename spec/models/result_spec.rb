require 'rails_helper'

RSpec.describe Result, type: :model do
  context 'associations' do
    it { should belong_to :student }
    it { should belong_to :course }
  end

  context 'validations' do
    it { should validate_presence_of :student }
    it { should validate_presence_of :course }
    it { should validate_presence_of :grade }
  end
end
