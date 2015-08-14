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
end
