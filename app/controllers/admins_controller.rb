class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_access_restriction
  
  def dashboard
  end
end
