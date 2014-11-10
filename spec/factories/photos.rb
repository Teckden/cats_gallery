include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :photo do
    title 'Missing'
    image { fixture_file_upload(Rails.root.join('spec', 'files', 'images', 'missing.jpeg'), 'image/png') }
  end

  factory :invalid_photo, parent: :photo do
    image nil
  end
end
