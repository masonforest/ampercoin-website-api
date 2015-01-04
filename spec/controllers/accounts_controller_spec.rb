require 'rails_helper'

describe AccountsController, type: :controller do
  describe 'POST /accounts' do
    it 'saves the account' do
      post :create, account: { public_key: :abc }

      expect(json['account']['public_key']).to eq('abc')
    end
  end

  describe 'GET /accounts' do
    it 'shows how many accounts are left' do
      create(:account, :paid)

      get :index

      expect(json['meta']['accounts_remaining']).to eq 9999
    end
  end
end
