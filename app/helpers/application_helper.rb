module ApplicationHelper
  def set_stock(stocks_arr, id)
    stock = stocks_arr.select {|stock| stock.id == id }
    stock[0]
  end
end
