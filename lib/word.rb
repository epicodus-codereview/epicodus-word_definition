class Word
  attr_reader(:name, :definitions)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @definitions = []
  end

  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end
end
