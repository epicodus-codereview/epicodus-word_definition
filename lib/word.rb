class Word
  attr_reader(:self, :definitions)

  define_method(:initialize) do |attributes|
    @self = attributes.fetch(:self)
    @definitions = []
  end

  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end
end
