class PortfolioController < ApplicationController
  before_action :trader_access_restriction

  def index
    @portfolio = current_user.portfolio
    @properties = current_user.properties
    @stocks = Stock.all
  end

  def create 
    current_user.create_portfolio(overall_worth: 0)
    flash[:notice] = "Trader portfolio has been initialized"
    redirect_to portfolio_path
  end 
end

