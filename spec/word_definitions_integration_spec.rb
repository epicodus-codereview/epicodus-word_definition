require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('The Word Definitions web app', {:type => :feature}) do
  before() do
    @test_word = Word.new({:self => 'harmonica'})
    @test_definition = Definition.new({:self => 'a musical wind instrument consisting of a small rectangular case containing a set of metal reeds connected to a row of holes, over which the player places the mouth and exhales and inhales to produce the tones.',
                                       :word => @test_word})
    @test_word.add_definition(@test_definition)
  end

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
      fill_in('word_name', :with => "#{@test_word.self()}")
      click_button('Submit')
      expect(page).to have_content("#{@test_word.self()}")
    end
  end

  describe('the unique word path') do
    it('takes the user to the unique word page') do
      visit("/words/#{@test_word.self()}")
      expect(page).to have_content("#{@test_word.self()}")
      expect(page).to have_content("No definition exists for #{@test_word.self()} yet!")
      fill_in('new_definition', :with => "#{@test_definition.self()}")
      click_button('Add')
      expect(page).to have_content("#{@test_definition.self()}")
    end
  end
end
