require 'rails_helper'

RSpec.describe Photo, :type => :model do

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image) }

    it 'should have a valid photo' do
      photo = FactoryGirl.build(:photo)
      expect(photo.valid?).to eq true
    end
  end

  describe 'searchable fields' do
    it { should have_searchable_field(:title) }
    it { should have_searchable_field(:tag_list) }
  end
end
