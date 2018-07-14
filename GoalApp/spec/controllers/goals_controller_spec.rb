require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  
  subject(:goal) { FactoryBot.build(:goal) }
      
  
  before :each do
    real_goal = Goal.new(user_id: 1, description: 'hey', is_public: true)
  end
  
  describe 'GET #new' do
    
  end
  
  describe 'POST #create' do
    it 'posts goal to user\'s page if valid params' do
      post :create, params: { 
        goal: { 
          user_id: goal.user_id,
          description: goal.description,
          is_public: goal.is_public
        }
      }
      expect(response).to redirect_to(user_url(goal.user_id))
      expect(response).to have_http_status(200)
    end
    it 'renders the new form if invalid params' do
      post :create, params: { 
        goal: { 
          user_id: -1
          description: goal.description,
          is_public: goal.is_public
        }
      }
      expect(flash[:errors]).to be_present
      expect(response).to render_template(:new)
    end
  end
  
  describe 'actions on specific goal' do
    before :each do
      test_goal = goal.save
    end
    
    describe 'GET #edit' do
      it 'renders the edit form' do
        get :edit, params: { id: test_goal.id }
        expect(response).to render_template(:edit)
      end
    end
    
    describe 'GET #show' do
      it 'renders the show form' do
        get :show, params: { id: test_goal.id }
        expect(response).to render_template(:show)
      end
    end
    
    describe 'PATCH #update' do
      it 'redirects to the specific goal\'s page if valid params' do
        patch :update, params: { id: test_goal.id }
        expect(response).to redirect_to(goal_url(test_goal.id))
      end
      it 'renders the edit form if invalid params' do
        begin
          patch :update, params: { id: -1 }
        rescue
          ActiveRecord::RecordNotFound
        end
        expect(flash[:errors]).to be_present
        expect(response).to render_template(:edit)
      end
    end
    
    describe 'DELETE #destroy' do
      delete :destroy, params: { id: test_goal.id }
      it 'redirects to user\s profile' do
        expect(response).to redirect_to(user_url(test_goal.user_id))
      end
    end
  end

end
    