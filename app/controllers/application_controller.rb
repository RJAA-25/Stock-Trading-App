class ApplicationController < ActionController::Base

  def admin_access_restriction
    unless current_user.role == "admin"
      redirect_to trader_dashboard_path
    end 
  end

  def trader_access_restriction
    unless current_user.role == "trader"
      redirect_to admin_dashboard_path
    end
  end
end
