require 'rails_helper'

RSpec.describe 'friends', type: :feature do
  scenario 'accept1' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Nata'
    fill_in 'Email', with: 'nata@nata'
    fill_in 'Password', with: 'natanata'
    fill_in 'Password confirmation', with: 'natanata'
    click_on 'Sign up'

    visit '/tweets/new'
    fill_in 'tweet_tweet', with: 'some text \n'
    expect(page).to have_text('Tweet something')
  end

  scenario 'accept' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Nata'
    fill_in 'Email', with: 'nata@nata'
    fill_in 'Password', with: 'natanata'
    fill_in 'Password confirmation', with: 'natanata'
    click_on 'Sign up'

    visit '/'
    expect(page).to have_text('Tweet')
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
