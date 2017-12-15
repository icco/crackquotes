require "rubygems"
require "bundler"
Bundler.require(:default, ENV["RACK_ENV"] || :development)
Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }

# Simple site to serve quotes.
get "/" do
  redirect "/quote/#{Quote.random}"
end

get "/about" do
  erb :about
end

get "/list" do
  @quotes = Quote.all.values
  erb :list
end

get "/quote/:id", provides: %i[html json] do
  id = params[:id].to_s
  @quote = Quote.get id

  if @quote.nil?
    404
  else
    erb :index
  end
end
