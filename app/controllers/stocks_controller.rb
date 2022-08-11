class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :all_stocks, only: [:index, :check]
  before_action :set_stock, only: [:show]

  def index
  end

  def show
    @portfolio = current_user.portfolio
    @property = current_user.properties.where(stock_id: @stock.id).first
    @transactions = current_user.transactions.where(stock_id: @stock.id).first(3)
    @recent_transactions = Transaction.where(stock_id: @stock.id).first(3)
  end

  def check
    search_symbol = params[:search].gsub(/\s+/, "").upcase
    @result = Stock.find_by(symbol: search_symbol)
    if @result
      redirect_to stock_path(@result)
    else
      client = IEX::Api::Client.new
      begin
        quote = client.quote(search_symbol)
      rescue IEX::Errors::SymbolNotFoundError
        quote = nil
      end
      if quote
        company = client.company(search_symbol)
        logo = client.logo(search_symbol)
        stock_params = {
          symbol: quote.symbol,
          name: quote.company_name,
          latest_price: quote.latest_price,
          exchange: company.exchange,
          sector: company.sector,
          industry: company.industry,
          description: company.description,
          logo: logo.url
        }
        @stock = Stock.create(stock_params)
        redirect_to stock_path(@stock)
      else
        flash.now[:alert] = "Stock symbol #{search_symbol} is not found"
        render :index, status: :not_found
      end
    end
  end

  private
  def all_stocks
    @stocks = Stock.all.order(symbol: :asc)
  end
  
  def set_stock
    @stock = Stock.find(params[:id])
  end
end
