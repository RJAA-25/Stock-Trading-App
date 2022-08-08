module AccountsHelper
  def pending_count(traders)
    traders.count { |trader| trader.status == "pending" }
  end
  
  def approved_count(traders)
    traders.count { |trader| trader.status == "approved" }
  end
end
