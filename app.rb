require('sinatra')
  require('sinatra/reloader')
  also_reload('lib/**/*.rb')
  require('./lib/definitions')
  require('./lib/words')

  get('/') do
    erb(:index)
  end

  get('/words/new') do
     erb(:words_form)
  end

  # get('/words') do
  #   @words = Word.all()
  #   erb(:words)
  # end

  post('/words') do
    name = params.fetch('name')
    Word.new(name).save()
    @words = Word.all()
    erb(:success)
  end

  # get('/definitions/:id') do
  #   @vehicle = Vehicle.find(params.fetch('id').to_i())
  #   erb(:vehicle)
  # end

  # get('/words/:id') do
  #   @word = Word.find(params.fetch('id').to_i())
  #   erb(:word)
  # end

  # get('/words/:id/definitions/new') do
  #     @word = Word.find(params.fetch('id').to_i())
  #     erb(:word_vehicles_form)
  # end

  # post('/definitions') do
  #   make = params.fetch('make')
  #   model = params.fetch('model')
  #   year = params.fetch('year')
  #   @vehicle = Vehicle.new(make, model, year)
  #   @vehicle.save()
  #   @word = Word.find(params.fetch('word_id').to_i())
  #   @word.add_vehicle(@vehicle)
  #   erb(:success)
  # end