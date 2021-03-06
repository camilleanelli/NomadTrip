require 'rails_helper'

RSpec.describe "login page", :type => :feature do
  it "fill with unknown user infromation reject login" do
    visit "/"

    click_link "Login"

    fill_in "Email", with: "johndoe@email.com"
    fill_in "Password", with: "password"
    click_button "Validate"

    expect(page).to have_content('Invalid Email or password.')
  end

  it 'login with valid user info' do
    User.create(first_name: "john", last_name: "doe", email: 'johndoe@email.com', password: 'password', confirmed_at: 1.day.ago)
    visit "/"

    click_link "Login"
    fill_in "Email", with: "johndoe@email.com"
    fill_in "Password", with: "password"
    click_button "Validate"
    expect(current_path).to eq dashboard_path
  end
end
