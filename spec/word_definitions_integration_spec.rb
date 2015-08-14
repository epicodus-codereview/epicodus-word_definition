require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('The Word Definitions web app', {:type => :feature}) do
  describe('the new word path') do
    it('takes the user to the new word form') do
      visit('/')
      expect(page).to have_content('Word Definitions')
      click_link('Add New Word')
      expect(page).to have_content('Add a New Word')
    end
  end

  describe('the post to index path') do
    it('takes the user to index to see listing of words') do
      visit('/words/new')
      expect(page).to have_content('Add a New Word')
      fill_in('word_name', :with => 'harmonica')
      click_button('Submit')
      expect(page).to have_content('harmonica')
    end
  end
end
