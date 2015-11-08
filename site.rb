require "rubygems"
require "bundler"
Bundler.require(:default, ENV["RACK_ENV"] || :development)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

# Simple site to serve quotes.
get "/" do
  @quote = Quote.random
  erb :index
end

get "/about" do
  erb :about
end

get "/img" do
  @quote = Quote.random
  @img = Image.random
  erb :image
end

get "/quote/:id", :provides => [:html, :json] do
  @quote = Quote.get params[:id].to_i

  if @quote.nil?
    404
  else
    erb :index
  end
end
