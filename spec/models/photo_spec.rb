require 'rails_helper'

RSpec.describe Photo, :type => :model do
  describe 'validations' do
    it 'should have a valid photo' do
      photo = FactoryGirl.build(:photo)
      expect(photo.valid?).to eq true
    end
  end
end
