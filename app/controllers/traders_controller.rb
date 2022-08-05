class TradersController < ApplicationController
  before_action :authenticate_user!
  before_action :trader_access_restriction
  
  def dashboard
  end
end
