class TransactionsController < ApplicationController
  def trader_transactions
    @transactions = current_user.transactions 
  end

  def all_transactions 
    @transactions = Transaction.all
  end

  def show 
    @transaction = Transaction.find(params[:id])
    @stock = Stock.find(@transaction.stock_id)
  end

  def buy 
    @stock = Stock.find(params[:id])
    # flash[:notice] = "You have reached buy action"
    # redirect_to stock_path(@stock)
    if current_user.properties.find_by(stock_id:@stock.id) 
      
    else
      # flash[:notice] = "You do not have #{@stock.symbol} stock"
      property_params = { 
        stock_id: @stock.id, 
        quantity: 5 
      }
      transaction_params = { 
        stock_id: @stock.id, 
        action: "buy", 
        quantity: 5, 
        price: 10, 
        total_amount: 50
      }
      @property = current_user.properties.create(property_params)
      @transaction = current_user.transactions.create(transaction_params)
      redirect_to transaction_path(@transaction)
    end
    
  end 

  def sell 
    @stock = Stock.find(params[:id])
    flash[:notice] = "You have reached sell action"
    redirect_to stock_path(@stock)
  end
end
