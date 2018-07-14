require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  subject(:user) { FactoryBot.build(:user) }
  
  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end
    
  describe 'POST #create' do
    context 'with valid params' do
      it 'redirects to user\'s show page' do
        post :create, params: { user: { username: user.username, password: user.password } }
        tester = User.find_by(username: user.username)
        expect(response).to redirect_to(user_url(tester))
      end
    end
    context 'with invalid params' do
      it 'renders the new template' do
        post :create, params: { user: { username: user.username, password: '' } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end
  end
  
  describe 'GET #show' do
    context 'with valid params' do
      it 'renders the show template' do
        user.save!
        tester = User.find_by(username: user.username)
        get :show, params: { id: tester.id }
        expect(response).to render_template(:show)
      end
    end
    
    context 'with invalid params' do
      it 'does not render the show template' do
        begin
          get :show, params: { id: -1 }
        rescue
          ActiveRecord::RecordNotFound
        end
        expect(response).to_not render_template(:show)
      end
    end
  end
  
end
