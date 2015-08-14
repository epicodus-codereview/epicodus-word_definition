require('rspec')
require('definition')

describe(Definition) do
  before() do
    @test_definition = Definition.new({:self => 'one of a pair of long, slender runners made of wood, plastic, or metal used in gliding over snow.'})
  end
  describe('#self') do
    it('returns itself') do
      expect(@test_definition.self()).to(eq('one of a pair of long, slender runners made of wood, plastic, or metal used in gliding over snow.'))
    end
  end
end
