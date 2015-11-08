require "rubygems"
require "bundler"
Bundler.require(:default, ENV["RACK_ENV"] || :development)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

# Simple site to serve quotes.
get "/", :provides => [:html, :json] do
  @quote = Quote.random

  case content_type
  when :html
    erb :index
  when :json
    json @quote.to_map
  end
end

get "/about" do
  render :about
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
    case content_type
    when :html
      erb :index
    when :json
      json @quote.to_map
    end
  end
end
