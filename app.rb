require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/') do
  word_name = params.fetch('word_name')
  word_definition = params.fetch('word_definition')

  new_word = Word.new({:self => word_name})
  if !word_definition.empty?()
    new_definition = Definition.new({:self => word_definition,
                                     :word => new_word})
    new_word.add_definition(new_definition)
  end
  new_word.save()

  @words = Word.all()
  erb(:index)
end

get('/words/new') do
  erb(:new_word)
end

get('/words/:name') do
  word_name = params.fetch('name')
  @word = Word.find(word_name)
  erb(:word)
end

post('/words/:name') do
  word_name = params.fetch('name')
  @word = Word.find(word_name)

  new_definition_string = params.fetch('new_definition')
  new_definition = Definition.new({:self => new_definition_string,
                                   :word => @word})
  @word.add_definition(new_definition)
  erb(:word)
end
