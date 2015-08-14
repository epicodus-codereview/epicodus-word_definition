class Definition
  attr_reader(:self)

  define_method(:initialize) do |attributes|
    @self = attributes.fetch(:self)
  end
end
