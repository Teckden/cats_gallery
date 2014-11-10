require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

  it 'renders template index' do
    get :index
    expect(response).to render_template(:index)
  end

end
