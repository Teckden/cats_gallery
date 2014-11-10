require 'rails_helper'

RSpec.describe PhotosController, :type => :controller do
  login_user

  context 'when photo exists' do
    before :each do
      @photo = FactoryGirl.create(:photo, user_id: User.first.id)
    end

    context 'GET index' do
      before(:each) { get :index }

      it 'assigns @photos' do
        expect(assigns(:photos)).to eq([@photo])
      end

      it 'renders index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'GET edit' do
      before(:each) { get :edit, id: @photo.id }

      it 'assigns @photo' do
        expect(assigns[:photo]).to eq(@photo)
      end

      it 'renders edit template' do
        expect(response).to render_template(:edit)
      end
    end

    context 'PUT update' do
      it 'updates @photo record' do
        title = 'New Title'
        put :update, {id: @photo.id, photo: @photo.attributes.merge(title: title)}
        expect(@photo.reload.title).to eq(title)
      end

      it 'redirects to photos' do
        put :update, { id: @photo.id, photo: @photo.attributes }
        expect(response).to redirect_to(photos_path)
      end

      it 'adds notice upon success' do
        put :update, { id: @photo.id, photo: @photo.attributes }
        expect(flash[:notice]).to eq('Photo is successfully updated')
      end

      it 'renders edit template when invalid params' do
        put :update, { id: @photo.id, photo: @photo.attributes.merge(title: nil) }
        expect(response).to render_template(:edit)
      end
    end

    context 'DELETE destroy' do
      it 'deletes @photo record' do
        expect{
          delete(:destroy, id: @photo.id)
        }.to change{Photo.count}.by(-1)
      end
      it 'redirects to photos_path' do
        delete :destroy, id: @photo.id
        expect(response).to redirect_to(photos_path)
      end

      it 'adds notice upon success' do
        delete :destroy, id: @photo.id
        expect(flash[:notice]).to eq('Photo is successfully deleted')
      end
    end
  end

  describe 'GET new' do
    before(:each) { get :new }
    it 'assigns @photo' do
      expect(assigns[:photo]).not_to eq(nil)
    end

    it 'renders new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    context 'when valid data' do
      let!(:params) { FactoryGirl.attributes_for(:photo) }

      it 'creates a new photo record' do
        expect{post(:create, photo: params)}.to change{Photo.count}.by(1)
      end

      it 'redirects to photos' do
        post :create, photo: params
        expect(response).to redirect_to(photos_path)
      end

      it 'adds notice upon success' do
        post :create, photo: params
        expect(flash[:notice]).to eq('Photo has been successfully uploaded')
      end
    end

    context 'when invalid data' do
      let!(:params) { FactoryGirl.attributes_for(:invalid_photo) }

      it 'should not create new Photo record' do
        expect{post(:create, photo: params)}.to change{Photo.count}.by(0)
      end

      it 'renders new template' do
        post :create, photo: params
        expect(response).to render_template(:new)
      end
    end
  end

end
