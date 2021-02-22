require 'rails_helper'

RSpec.describe 'follow', type: :feature do
  scenario 'accept1' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Nata'
    fill_in 'Email', with: 'nata@nata'
    fill_in 'Password', with: 'natanata'
    fill_in 'Password confirmation', with: 'natanata'
    click_on 'Sign up'

    click_on 'User page'
    expect(page).to have_text('Tweets')
  end

  scenario 'no requests' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Nata'
    fill_in 'Email', with: 'nata@nata'
    fill_in 'Password', with: 'natanata'
    fill_in 'Password confirmation', with: 'natanata'
    click_on 'Sign up'
    visit '/tweets/new'
    expect(page).to have_text('Tweet')
  end

  it 'works' do
    expect(true).to be(true)
  end
end
