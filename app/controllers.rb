# Simple site to serve quotes.

Quotes.controllers  do
  get '/' do
    @quote = Quote.random
    erb :index
  end

  get '/json' do
    @quote = Quote.random
    json @quote.to_map
  end
end
