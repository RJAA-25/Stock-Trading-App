module AccountsHelper
  def pending_trader_count(traders)
    traders.count { |trader| trader.status == "pending" }
  end
  
  def approved_trader_count(traders)
    traders.count { |trader| trader.status == "approved" }
  end
end
