# Simple site to serve quotes.

Quotes.controllers  do
  get :index, :provides => [:html, :json] do
    case content_type
    when :html
      @quote = Quote.random
      render :index
    when :json
      @quote = Quote.random
      render @quote.to_map
    end
  end
end
