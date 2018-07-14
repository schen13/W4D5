require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  
  background :each do 
    visit new_user_url
  end
  
  scenario 'has a new user page' do
    expect(page).to have_content('Form for signing up')
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
      fill_in 'Username', with: 'walter_white'
      fill_in 'Password', with: 'saymyname'
      click_on 'Submit'
      expect(page).to have_content('walter_white')
    end
  end
  
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    user = User.create(username: 'walter_white', password: 'saymyname')
    visit new_session_url
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'saymyname'
    click_on 'Submit'
    expect(page).to have_content('walter_white')
  end

end

feature 'logging out' do
  background :each do 
    user = User.create(username: 'walter_white', password: 'saymyname')
    visit new_session_url
  end
  
  scenario 'begins with a logged out state' do
    expect(page).to have_content('Form for login')
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    fill_in 'Username', with: 'walter_white'
    fill_in 'Password', with: 'saymyname'
    click_on 'Submit'
    
    click_on 'Log Out'
    expect(page).not_to have_content('walter_white')
  end

end