require 'rails_helper'

RSpec.describe User, type: :feature do
  describe 'user index page' do
    before do
      @user1 = User.create(name: 'FirstUser', post_counter: 2, photo: 'https://picsum.photos/100')
      @user2 = User.create(name: 'SecondUser', post_counter: 8, photo: 'https://picsum.photos/100')
      visit users_path
    end
    it 'displays username for all users' do
      expect(page).to have_content('FirstUser')
      expect(page).to have_content('SecondUser')
    end

    it 'displays profile picture for each user' do
      expect(page).to have_css("img[src*='#{@user1.photo}']")
      expect(page).to have_css("img[src*='#{@user2.photo}']")
    end

    it 'displays number of posts user has' do
      expect(page).to have_content(@user1.post_counter)
      expect(page).to have_content(@user2.post_counter)
    end

    it 'redirects to user show page when click on user' do
      click_link 'FirstUser'
      expect(page).to have_current_path(user_path(User.find_by(name: 'FirstUser')))
    end
  end
end
