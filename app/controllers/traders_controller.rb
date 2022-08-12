class TradersController < ApplicationController
  before_action :authenticate_user!
  before_action :trader_access_restriction

  # def overall_worth(id)
  def portfolio_overall_worth
        # @properties = Portfolio.find(id).properties 
        overall_worth = 0 
        # @properties.each do |prop| 
        current_user.portfolio.properties.each do |prop|
        price = Stock.find(prop.stock_id).latest_price 
        overall_worth += prop.quantity * price 
      end 
    overall_worth
  end 
  
  def dashboard
    @portfolio =  current_user.portfolio
    @transactions = current_user.transactions.first(3)
    @portfolio.update(overall_worth: portfolio_overall_worth)
  end

  def portfolio
    @portfolio = current_user.portfolio
    @properties = current_user.properties
    @stocks = Stock.all
  end

  def transactions
    @all_transactions = current_user.transactions
    @buy_transactions = current_user.transactions.buy
    @sell_transactions = current_user.transactions.sell
    @stocks = Stock.all
  end
end
