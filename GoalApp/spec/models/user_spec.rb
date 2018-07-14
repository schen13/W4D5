require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:tester) { FactoryBot.build(:user) }
  
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }
    
    it 'does\'nt save passwords in database' do
      user = User.create(username: tester.username, password: tester.password)
      user = User.find_by(username: user.username)
      expect(user.password).to_not eq('password')
    end
  end
  
  describe 'associations' do
    it { should have_many(:goals) }
  end
  
  describe 'class methods' do
    context '::find_by_credentials' do
      it 'should return a user if user exists in the database' do
        tester.save!
        test_user = User.find_by_credentials(tester.username, 'password')
        expect(test_user).to be_truthy
      end
      
      it 'should return nil if user does not exist' do
        test_user = User.find_by_credentials(tester.username, 'password')
        expect(test_user).to be_nil
      end
    end
  end
  
end
