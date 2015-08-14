require('rspec')
require('word')

describe(Word) do
  before() do
    @test_word = Word.new({:name => 'word'})
  end

  describe('#name') do
    it('returns the word itself') do
      expect(@test_word.name()).to(eq('word'))
    end
  end

  describe('#definitions') do
    it('returns the word\'s definition; starts out empty') do
      expect(@test_word.definitions()).to(eq([]))
    end
  end
end
