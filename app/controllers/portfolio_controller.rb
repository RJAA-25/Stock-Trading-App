class PortfolioController < ApplicationController
  def index
    # @portfolios = current_user.portfolio 
    # @portfolios = current_user.properties 
    # about to formulate logic in displaying properties
    @portfolio = current_user.portfolio
  end

  def create 
    @user.portfolio.create(overall_worth: 0)
    redirect_to portfolio/index
  end 

  def new 
    @portfolio = Portfolio.new
  end 
end

