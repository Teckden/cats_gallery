require 'rails_helper'

RSpec.describe User, :type => :model do

  describe 'associations' do
    it { should have_many(:photos).dependent(:destroy) }
  end

  describe 'validations' do
    it 'should have a valid user' do
      user = FactoryGirl.build(:user)
      expect(user.valid?).to eq true
    end
  end
end
