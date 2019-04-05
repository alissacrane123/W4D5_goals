require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  background(:each) do 
    visit new_user_path
  end 

  scenario "should be a sign up page" do 
    expect(page).to have_content("Sign up!")
  end 

  scenario "contains a new user form" do
    expect(page).to have_content(/username/i)
    expect(page).to have_content("Password")
  end 

  scenario 'fill in the new user form' do 
    user_attr = FactoryBot.build(:user)
    fill_in("Username", with: user_attr.username)
    fill_in("Password", with: user_attr.password)
    click_button("Sign up!")

    user = User.find_by(username: user_attr.username)
    expect(user).not_to be_nil 

    expect(current_path).to eq(user_path(user))

    expect(page).to have_content(user.username)

  end
end

