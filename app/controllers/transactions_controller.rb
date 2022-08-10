class TransactionsController < ApplicationController

  def trader_transactions
    @transactions = current_user.transactions 
    @stocks = Stock.all
  end 

  def all_transactions 
    @transactions = Transaction.all
  end

  def show 
    @transaction = Transaction.find(params[:id])
    @stock = Stock.find(@transaction.stock_id)
  end

  def buy 
    buy_quantity = params[:buy].to_d
    @stock = Stock.find(params[:id])
    @trader = User.find(current_user.id)
    @portfolio = Portfolio.find_by(user_id: current_user.id)
    if current_user.status == "approved" && @portfolio
      cost = @stock.latest_price * buy_quantity
      if current_user.balance >= cost
        @property = current_user.properties.find_by(stock_id: @stock.id)
        # If property is present in portfolio
        if @property
          # Create Transaction
          transaction_params = { 
            stock_id: @stock.id, 
            action: "buy", 
            quantity: buy_quantity, 
            price: @stock.latest_price, 
            total_amount: cost
          }
          @transaction = current_user.transactions.create(transaction_params)
          # Update Trader balance
          # @trader.balance -= cost
          # @trader.save
          @trader.update(balance: @trader.balance - cost)
          # Update Property
          property_params = {
            quantity: @property.quantity + buy_quantity
          }
          @property.update(property_params)
          redirect_to transaction_path(@transaction)
        # If property is not in portfolio
        else
          # Create Transaction
          transaction_params = { 
            stock_id: @stock.id, 
            action: "buy", 
            quantity: buy_quantity, 
            price: @stock.latest_price, 
            total_amount: @stock.latest_price * buy_quantity
          }
          @transaction = current_user.transactions.create(transaction_params)
          # Update Trader balance
          # @trader.balance -= cost
          # @trader.save
          @trader.update(balance: @trader.balance - cost)
          # Create Property
          property_params = { 
            stock_id: @stock.id, 
            quantity: buy_quantity
          }
          @property = @portfolio.properties.create(property_params)
          redirect_to transaction_path(@transaction)
        end
      else 
        flash[:alert] = "You have insufficient funds to perform this action"
        redirect_to stock_path(@stock)
      end
    else 
      message = ""
      message += "Your account has not been approved. " if current_user.status != "approved"
      message += "You have yet to setup your portfolio. " if !@portfolio
      flash[:alert] = message
      redirect_to stock_path(@stock)
    end
  end 

  def sell 
    sell_quantity = params[:sell].to_d
    @stock = Stock.find(params[:id]) 
    @trader = User.find(current_user.id)
    @portfolio = Portfolio.find_by(user_id: current_user.id)
    if current_user.status == "approved" && @portfolio
      @property = current_user.properties.find_by(stock_id: @stock.id)
      if @property
        if @property.quantity >= sell_quantity
          cost = @stock.latest_price * sell_quantity
          # Create Transaction
          transaction_params = { 
            stock_id: @stock.id, 
            action: "sell", 
            quantity: sell_quantity, 
            price: @stock.latest_price, 
            total_amount: cost
          }
          @transaction = current_user.transactions.create(transaction_params)
          # Update Trader balance
          # @trader.balance += cost
          # @trader.save
          @trader.update(balance: @trader.balance + cost)
          # Update Property
          property_params = {
            quantity: @property.quantity - sell_quantity
          }
          @property.update(property_params)
          redirect_to transaction_path(@transaction)
        else 
          flash[:alert] = "You do not own enough stocks"
          redirect_to stock_path(@stock)
        end 
      else
        flash[:alert] = "You do not own this stock"
        redirect_to stock_path(@stock)
      end
    else
      message = ""
      message += "Your account has not been approved. " if current_user.status != "approved"
      message += "You have yet to setup your portfolio. " if !@portfolio
      flash[:alert] = message
      redirect_to stock_path(@stock)
    end
  end
end
