require('sinatra')
  require('sinatra/reloader')
  also_reload('lib/**/*.rb')
  require('./lib/definition')
  require('./lib/word')

  get('/') do
    erb(:index)
  end

  get('/words/new') do
     erb(:words_form)
  end

  get('/words') do
    @words = Word.all()
    erb(:words)
  end

  post('/words') do
    name = params.fetch('name')
    Word.new(name).save()
    @words = Word.all()
    erb(:success)
  end

  get('/definitions/:id') do
    @word = Definition.find(params.fetch('id').to_i())
    erb(:word)
  end

  get('/words/:id') do
    @word = Word.find(params.fetch('id').to_i())
    erb(:word)
  end

  get('/words/:id/definitions/new') do
      @word = Word.find(params.fetch('id').to_i())
      erb(:word_definitions_form)
  end

  post('/definitions') do
    year = params.fetch('year')
    @word = Definition.new(year)
    @word.save()
    @word = Word.find(params.fetch('word_id').to_i())
    @word.add_word(@word)
    erb(:success)
  end