class Word
  attr_reader(:name, :definitions)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @definitions = []
  end
end
