require('rspec')
require('definition')

describe(Definition) do
  before() do
    @test_definition_props = {:self => 'one of a pair of long, slender runners made of wood, plastic, or metal used in gliding over snow.',
                              :word => Word.new({:self => 'ski'})}
    @test_definition = Definition.new({:self => @test_definition_props.fetch(:self),
                                       :word => @test_definition_props.fetch(:word)})
  end

  describe('#self') do
    it('returns the actual definition string') do
      expect(@test_definition.self()).to(eq(@test_definition_props.fetch(:self)))
    end
  end

  describe('#word') do
    it('returns Word instance that it defines') do
      expect(@test_definition.word()).to(eq(@test_definition_props.fetch(:word)))
    end
  end
end
