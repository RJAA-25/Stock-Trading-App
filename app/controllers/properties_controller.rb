class PropertiesController < ApplicationController

  def show
    # @stock = Stock.find(@property.stock_id)
    # @transactions = current_user.transactions.where(stock_id: @property.stock_id).order(created_at: :desc)
    @property = Property.find(params[:id])
    @stock = Stock.find(@property.stock_id)
    @transaction = Transaction.find(params[:id])
    @transactions = current_user.transactions.where(stock_id: @property.stock_id)
    @stocks = Stock.all
  end
end
