require('sinatra')
require('pry')
require('sinatra/reloader')
require('./lib/parcels')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/result') do
  @height = params.fetch("height").to_f()
  @width = params.fetch("width").to_f()
  @depth = params.fetch("depth").to_f()
  @weight = params.fetch("weight").to_f()
  @distance = params.fetch("distance").to_f()
  test_parcel = Parcel.new(@height, @width, @depth, @weight, @distance )
  @shipping_cost= test_parcel.cost_to_ship()
  @volume=test_parcel.volume()
  erb(:result)
end