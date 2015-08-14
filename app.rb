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
  new_definition = Definition.new({:self => word_definition,
                                   :word => new_word})

  new_word.add_definition(new_definition)
  new_word.save()

  @words = Word.all()
  erb(:index)
end

get('/words/new') do
  erb(:new_word)
end

get('/words/:name') do
  @word = Word.find(:name)
  erb(:word)
end
