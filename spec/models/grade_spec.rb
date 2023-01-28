require 'rails_helper'

RSpec.describe Grade, type: :model do
  context 'associations' do
    it { should belong_to :student }
    it { should belong_to :course }
  end
end
