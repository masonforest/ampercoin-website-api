class AccountsController < ApplicationController
  def create
    account = Account.new(account_params)

    if account.save
      render json: account
    else
      render json: account.errors
    end
  end

  def show
    account = Account.find_by_address!(params[:id])

    render json: account
  end

  def account_params
    params.require(:account).permit([:address, :public_key])
  end
end
