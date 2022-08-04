class PortfolioController < ApplicationController
  def index
    @portfolio = @portfolio.stocks 
  end
end
