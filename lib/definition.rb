class Definition
  attr_reader(:self, :word)

  define_method(:initialize) do |attributes|
    @self = attributes.fetch(:self)
    @word = attributes.fetch(:word)
  end
end
