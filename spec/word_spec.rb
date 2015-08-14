require('rspec')
require('word')

describe(Word) do
  before() do
    Word.clear()
    @test_word = Word.new({:self => 'word'})
    @test_word_definition = Definition.new({:self => 'a unit of language, consisting of one or more spoken sounds or their written representation, that functions as a principal carrier of meaning.',
                                            :word => @test_word})
    @test_word_definition2 = Definition.new({:self => 'a short talk or conversation',
                                            :word => @test_word})

  end

  describe('#self') do
    it('returns the actual word string') do
      expect(@test_word.self()).to(eq('word'))
    end
  end

  describe('#definitions') do
    it('returns the word\'s definitions; starts out empty') do
      expect(@test_word.definitions()).to(eq([]))
    end
  end

  describe('#add_definition') do
    it('adds a Definition instance to the Word instance') do
      @test_word.add_definition(@test_word_definition)
      expect(@test_word.definitions()).to(eq([@test_word_definition]))
    end
    it('adds another Definition instance to the Word instance') do
      @test_word.add_definition(@test_word_definition)
      @test_word.add_definition(@test_word_definition2)
      expect(@test_word.definitions()).to(eq([@test_word_definition, @test_word_definition2]))
    end
  end

  describe('#save') do
    it('saves the word instance to the Word class array') do
      @test_word.save()
      expect(Word.all()).to(eq([@test_word]))
    end
  end

  describe('.all') do
    it('starts out empty') do
      expect(Word.all()).to(eq([]))
    end
  end
end
