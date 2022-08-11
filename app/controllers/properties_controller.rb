class PropertiesController < ApplicationController
  before_action :trader_access_restriction

  def show
    @property = Property.find(params[:id])
    @stock = Stock.find(@property.stock_id)
    @transactions = current_user.transactions.where(stock_id: @property.stock_id)
  end
end
