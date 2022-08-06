class PortfolioController < ApplicationController
  def index
    # @portfolios = current_user.portfolio 
    # @portfolios = current_user.properties 
    # about to formulate logic in displaying properties
    @portfolio = current_user.portfolio
  end

  def create 
    current_user.create_portfolio(overall_worth: 0)
    # @portfolio = Portfolio.create()
    redirect_to portfolio_index_path
  end 
end

