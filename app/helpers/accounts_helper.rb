module AccountsHelper
  def trader_count
    User.where(role: "trader").count
  end

  def pending_trader_count
    User.where(role:"trader", status: "pending").count 
  end
  
  def approved_trader_count
    User.where(role: "trader", status:"approved").count
  end
end
