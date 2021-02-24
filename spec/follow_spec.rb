require 'rails_helper'

RSpec.describe 'follow', type: :feature do
  scenario 'user page' do
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
    click_on 'User page'
    sleep 1
    find("input[name='commit']").click
    sleep 1
    expect(page).to have_text('Friendship was saved correctly.')
  end

  scenario 'no requests' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Nata'
    fill_in 'Email', with: 'nata@nata'
    fill_in 'Password', with: 'natanata'
    fill_in 'Password confirmation', with: 'natanata'
    click_on 'Sign up'
    click_on 'User page'
    sleep 1
    find("input[name='commit']").click
    sleep 1
    click_on 'Unfollow'
    expect(page).to have_text('Friendship was rejected.')
  end
end
