class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_access_restriction
  
  def dashboard
    @traders = User.traders
    @transactions = Transaction.all
  end

  def transactions
    @all_transactions = Transaction.all
    @buy_transactions = Transaction.buy
    @sell_transactions = Transaction.sell
    @stocks = Stock.all
  end
end
