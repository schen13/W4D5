require 'rails_helper'

RSpec.describe Goal, type: :model do
  
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:public) }
  end
  
  describe 'associations' do
    it { should belong_to(:user) }
  end
  
end

