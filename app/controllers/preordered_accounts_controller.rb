class PreorderedAccountsController < ApplicationController
  def create
    account = PreorderedAccount.new(account_params)

    if account.save
      render json: account
    else
      render json: account.errors
    end
  end

  def show
    account = PreorderedAccount.find_by_address!(params[:id])

    render json: account
  end

  def index
    accounts = PreorderedAccount.last_3

    render(
      json: accounts,
      meta: { accounts_remaining: PreorderedAccount.remaining }
    )
  end

  def account_params
    params.require(:preordered_account).permit([:address, :public_key])
  end
end
