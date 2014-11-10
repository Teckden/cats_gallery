require 'rails_helper'

RSpec.describe SearchController, :type => :controller do
  login_user

  let!(:photo) { FactoryGirl.create(:photo) }

  before :each do
    get :index, term: photo.title
  end

  it 'should trigger search with params' do
    expect(Sunspot.session).to be_a_search_for(Photo)
  end

  it 'should have search params' do
    expect(Sunspot.session).to have_search_params(:fulltext, photo.title)
  end

  it 'assigns @photos' do
    expect(assigns[:photos]).not_to eq(nil)
  end

  it 'renders index template' do
    expect(response).to render_template(:index)
  end
end
