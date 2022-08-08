class TransactionsController < ApplicationController
  def trader_transactions
    @transactions = current_user.transactions 
  end

  def all_transactions 
    @transaction = Transaction.all
  end

  def show 
    @transaction = Transaction.find(params["id"])
  end
end
