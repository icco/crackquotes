# Simple site to serve quotes.

Quotes.controllers  do
  get :index, :provides => [:html, :json] do
    @quote = Quote.random

    case content_type
    when :html
      render :index
    when :json
      render @quote.to_map
    end
  end

  get :about do
    render :about
  end

  get :quote, :with => :id, :provides => [:html, :json] do
    @quote = Quote.get params[:id].to_i

    if @quote.nil?
      404
    else
      case content_type
      when :html
        render :index
      when :json
        render @quote.to_map
      end
    end
  end
end
