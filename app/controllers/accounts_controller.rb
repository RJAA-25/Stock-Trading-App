class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :role_access_restriction
  before_action :set_account, only: [:show, :edit, :update]

  def index
    @accounts = User.where(role: "trader").order(last_name: :asc)
  end

  def show
  end

  def new
    @account = User.new
  end

  def create
    @account = User.new(account_user_params)
    if @account.save
      flash[:notice] = "Trader Account has been created successfully"
      redirect_to account_path(@account)
    else
      flash[:alert] = "Oh no! Something went wrong. Check inputs carefully"
      render :new
    end
  end

  def edit
  end

  def update
    if @account.update(account_user_params)
      flash[:notice] = "Trader Account has been updated successfully"
      redirect_to account_path(@account)
    else
      flash[:alert] = "Oh no! Something went wrong. Check inputs carefully"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end


  private
  def role_access_restriction
    unless current_user.role == "admin"
      redirect_to trader_dashboard_path
    end    
  end

  def set_account 
    @account = User.find(params[:id])
  end

  def account_user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
