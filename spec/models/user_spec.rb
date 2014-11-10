require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'validations' do
    it 'should have a valid user' do
      user = FactoryGirl.build(:user)
      expect(user.valid?).to eq true
    end
  end
end
