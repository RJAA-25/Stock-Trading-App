class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_access_restriction
  
  def dashboard
    @traders = User.where(role: "trader")
  end
end
